fs = require "fs"

console.log process.memoryUsage()

fs.readdir __dirname , (err,files) ->
  console.log ""
  if (err) then return console.log err
  if !files.length then console.log "No files"
  console.log "   Select which file or directory you want to see\n"
  file (i) ->
    filename = file[i]
	fs.stat __dirname + "\" + filename , (err,stat) ->
