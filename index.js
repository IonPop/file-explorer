'use strict';
var fs;

fs = require("fs");

console.log(process.memoryUsage());

fs.readdir(__dirname, function(err, files) {
  var file;

  console.log("");
  if (err) {
    return console.log(err);
  }
  if (!files.length) {
    console.log("No files");
  }
  console.log("   Select which file or directory you want to see\n");
  file = function(i) {
    var filename;

    filename = file[i];
    return fs.stat(__dirname + '\\' + filename, function(err, stat) {
      if (err) {
        return console.log(err);
      }
      if (stat.isDirectory()) {
        console.log('     ' + i + '   \x033[36m' + filename + '/\x033[39m');
      } else {
        console.log('     ' + i + '   \x033[90m' + filename + '\x033[39m');
      }
      i += 1;
      if (i === files.length()) {
        console.log("");
        process.stdout.write('   \x033[33mEnter your choice: \x033[39m');
        return process.stdin.resume();
      } else {
        return file(i);
      }
    });
  };
  return file(0);
});
