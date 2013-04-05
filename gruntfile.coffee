module.exports = (grunt) ->
	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-watch'
	grunt.loadNpmTasks 'grunt-contrib-jshint'
	
	grunt.initConfig 
		pkg: grunt.file.readJSON('package.json')
		jshint:
			build: 
				options: 
					jshintrc: '.jshintrc'
				src: ['build/**/*.js']

		coffee:
			compile:
				options:
					bare: true
				files: [
					expand:true
					cwd: 'coffee/'
					src: ['**/*.coffee']
					dest: ''
					ext: '.js'	
				]
		watch:
			files: 'coffee/**'
			tasks: ['coffee:compile']
			
	grunt.registerTask 'compile', 'coffee:compile'	
	grunt.registerTask 'default' , ['coffee','jshint']