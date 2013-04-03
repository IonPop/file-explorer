'use strict'
fs = require "fs"

console.log process.memoryUsage()

fs.readdir __dirname , (err,files) ->
	console.log ""
	if (err) then return console.log err
	if !files.length then console.log "No files"
	console.log "   Select which file or directory you want to see\n"
	file = (i) ->
		filename = file[i]
		fs.stat __dirname + '\\' + filename , (err,stat) ->
			if err then return console.log err
			if stat.isDirectory() then  console.log('     '+i+'   \x033[36m' + filename + '/\x033[39m')
			else console.log('     '+i+'   \x033[90m' + filename + '\x033[39m')
			i += 1
			if i is files.length() 
				console.log ""
				process.stdout.write('   \x033[33mEnter your choice: \x033[39m')
				process.stdin.resume()
			else file(i)
	file(0)		