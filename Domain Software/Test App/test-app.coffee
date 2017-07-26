app = do require 'express'

port = 1003

app.get '/', (req, res) ->
	res.status(200).send """
<html>
<head>
	<title>ScaleIT Side Car Test App</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha256-rr9hHBQ43H7HSOmmNkxzQGazS/Khx+L8ZRHteEY1tQ4=" crossorigin="anonymous"></link>
	<script src="https://cdn.jsdelivr.net/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha256-+kIbbrvS+0dNOjhmQJzmwe/RILR/8lb/+4+PUNVW09k=" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>ScaleIT Side Car Test App</h1>
		<p>The server has recived the following request headers:</p>
		<table class="table">
#{("			<tr><td><b>#{k}</b></td><td>#{v}</td><tr>" for k, v of req.headers).join '\n'}
		</table>
	</div>
</body>
</html>"""


app.listen port, () -> console.log "Listening on port #{port}!"