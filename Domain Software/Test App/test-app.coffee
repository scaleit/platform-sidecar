$ = require 'dollar'
app = do require 'express'
http = require 'http'
basicAuth = require 'express-basic-auth'
querystring = require 'querystring'
url = require "url"

port = 1000
auth_server = "localhost:1001"
license_server = "localhost:1002"
globalTimeout = 15000 # ms

read = (s, cb) ->
	bufs = []
	removeListeners = () ->
		s.removeListener 'error', on_error
		s.removeListener 'data', on_data
		s.removeListener 'end', on_end
		clearTimeout timeout if timeout?
	timeout = setTimeout () ->
		timeout = null
		do removeListeners
		do s.destroy
		cb new Error 'timeout'
	, globalTimeout
	s.on 'data', on_data = (buf) -> bufs.push buf
	s.once 'end', on_end = () ->
		do removeListeners
		cb null, Buffer.concat bufs
	s.once 'error', on_error = (err) ->
		do removeListeners
		cb err

http_get = (opts, seq, cb) ->
	cb = seq if !cb?
	opts = url.parse opts if typeof opts == 'string'
	req = http.get opts
	timeout = null
	tmpErr = new Error
	removeListeners = () ->
		req.removeListener 'error', on_error
		req.removeListener 'response', on_response
		req.removeListener 'socket', on_socket
		clearTimeout timeout if timeout?
		req.on 'error', (err) -> #console.log "ignoring error on request after response: #{err.message}"
	req.once 'error', on_error = (err) ->
		do removeListeners
		tmpErr.message = err.message
		cb tmpErr
	req.once 'response', on_response = (response) ->
		do removeListeners
		#console.log response
		cb null, response
	req.once 'socket', on_socket = () ->
		timeout = setTimeout () ->
			do removeListeners
			do req.abort
			tmpErr.message = 'timeout'
			cb tmpErr
		, globalTimeout
 
auth = basicAuth
	authorizeAsync: true
	challenge: true
	realm: 'Login'
	authorizer: $ (user, password) ->
		try
			res = yield $ http_get, "http://#{auth_server}/?#{querystring.stringify {user, password}}"
			data = JSON.parse yield $ read, res
		catch err
			console.log err.stack
			return false
		return data == "ok"

app.get '/', auth, $ (req, res) ->
	app = "default"
	{user} = req.auth
	try
		res2 = yield $ http_get, "http://#{license_server}/?#{querystring.stringify {user, app}}"
		data = JSON.parse yield $ read, res2
	catch err
		console.log err.stack
		res.status(200).send 'License server error'
		return false
	if data != "ok"
		res.status(200).send 'You do not passed the license check'
		return
	res.status(200).send 'You passed'
	# TODO: reverse proxy to the app server


app.listen port, () -> console.log "Listening on port #{port}!"