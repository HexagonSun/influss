# https://cr.yp.to/ucspi-tcp/tcpserver.html
tcpserver -1 0.0.0.0 ${INFLUSS_DB_HEALTH_CHECK_PORT:-5400} yes &
