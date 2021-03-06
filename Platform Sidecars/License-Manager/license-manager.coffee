app = do require 'express'

port = 1002
app_list = # stores multiple usernames per appname
	'testapp': ['peter']

app.get '/', (req, res) ->
	{app, user} = req.query
	if app_list[app]? && user in app_list[app]
		res.status(200).send JSON.stringify "ok"
	else
		res.status(200).send JSON.stringify "user not licensed"

app.listen port, () -> console.log "Listening on port #{port}!"