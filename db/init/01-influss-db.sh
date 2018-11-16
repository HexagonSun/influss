#!/bin/bash

# Immediately exits if any error occurs during the script
# execution. If not set, an error could occur and the
# script would continue its execution.
set -o errexit


# Creating an array that defines the environment variables
# that must be set. This can be consumed later via arrray
# variable expansion ${REQUIRED_ENV_VARS[@]}.
readonly REQUIRED_ENV_VARS=(
  "INFLUSS_DB_USER"
  "INFLUSS_DB_PASSWORD"
  "INFLUSS_DB_DATABASE"
  "POSTGRES_USER")


# Main execution:
# - verifies if all environment variables are set
# - runs the SQL code to create user and database
main() {
  check_env_vars_set
  init_user_and_db
}


# Checks if all of the required environment
# variables are set. If one of them isn't,
# echoes a text explaining which one isn't
# and the name of the ones that need to be
check_env_vars_set() {
  for required_env_var in ${REQUIRED_ENV_VARS[@]}; do
    if [[ -z "${!required_env_var}" ]]; then
      echo "Error:
    Environment variable '$required_env_var' not set.
    Make sure you have the following environment variables set:
      ${REQUIRED_ENV_VARS[@]}
Aborting."
      exit 1
    fi
  done
}


# Performs the initialization in the already-started PostgreSQL
# using the preconfigured POSTGRE_USER user.
init_user_and_db() {
  echo "~~~~~~~~~ INIT 1: create user/schema ~~~~~~~~~~~"
  psql -v ON_ERROR_STOP=1 \
       -v VERBOSITY=verbose \
       --username "$POSTGRES_USER" \
       --dbname=$INFLUSS_DB_DATABASE <<-EOSQL

     -- https://www.postgresql.org/docs/9.3/ddl-schemas.html
     -- restrict/remove access on public schema
     REVOKE CREATE ON SCHEMA public FROM PUBLIC;

     -- set default search path to the one-and-only schema we use
     ALTER ROLE $INFLUSS_DB_USER SET search_path = $INFLUSS_DB_DATABASE;
     ALTER DATABASE $INFLUSS_DB_DATABASE SET search_path TO $INFLUSS_DB_DATABASE;
EOSQL

  echo "~~~~~~~~~ INIT 2: create MESSAGE ~~~~~~~~~~~"
  psql -v ON_ERROR_STOP=1 \
       -v VERBOSITY=verbose \
       --username "$POSTGRES_USER" \
       --dbname=$INFLUSS_DB_DATABASE <<-EOSQL
     CREATE SCHEMA $INFLUSS_DB_DATABASE;

     CREATE TABLE $INFLUSS_DB_DATABASE.MESSAGE (
    ID SERIAL PRIMARY KEY not null,
    TEXT varchar(1024) not null,
    VALID_FROM date not null,
    INVALID_FROM date not null,
    AUTHOR varchar(128) not null,
    CREATED_AT date not null,
    MODIFIED_AT date not null,
    DELETED bit
);

CREATE INDEX ON $INFLUSS_DB_DATABASE.MESSAGE (VALID_FROM, INVALID_FROM);
EOSQL
}

# Executes the main routine with environment variables
# passed through the command line. We don't use them in
# this script but now you know 🤓
main "$@"
