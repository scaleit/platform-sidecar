app = do require 'express'

port = 1001
user_list =
	peter: 'jo'
	admin: 'save'
	josef: 'he!'

app.get '/', (req, res) ->
	{user, password} = req.query
	if user_list[user] == password
		res.status(200).send JSON.stringify "ok"
	else
		res.status(200).send JSON.stringify "wrong user or password"

app.listen port, () -> console.log "Listening on port #{port}!"