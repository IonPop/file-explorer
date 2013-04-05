fs = require('fs')
spdy = require('spdy')

options =
	key: fs.readFileSync('keys/spdy-key.pem')
	cert: fs.readFileSync('keys/spdy-cert.pem')
	ca: fs.readFileSync('keys/spdy-csr.pem')


server = spdy.createServer  options, (req, response) ->
	headers =  'content-type': 'application/javascript'
	response.push '/main.js', headers, undefined,(err, stream) ->
		if (err) then console.log err ;return
		else stream.end  'alert("hello from push stream!");'
	response.writeHead 200  , 
		"Content-Type": "text/html"
	response.end '<head><script src="/main.js"></script></head><p>Hello World</p>'


server.listen 443
