import app from "./app";
const PORT = process.env.INFLUSS_SERVER_API_NODE_PORT != undefined
	? process.env.INFLUSS_SERVER_API_NODE_PORT
	: 5005;

app.listen(PORT, () => {
    console.log('Express server listening on port ' + PORT);
})
