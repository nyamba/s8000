module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json'),
    sass:
      dist:
        options:
          sourcemap: 'none'
          noCache: true
        files: [
          expand: true,
          cwd:    'sass',
          src:    ['*.sass']
          dest:   'app/css'
          ext:    '.css'
        ]
    jade:
      compile:
        options:
          pretty: true
        files: [
          expand: true,
          cwd:    'jade',
          src:    ['*.jade']
          dest:   'app/'
          ext:    '.html'
        ]
    connect:
      server:
        options:
          livereload: true
          base: ['app']
    watch:
      options:
        livereload: true
      html:
        files: ['jade/*.jade']
        tasks: ['jade']
      css:
        files: ['sass/*.sass']
        tasks: ['sass']

    grunt.loadNpmTasks 'grunt-contrib-sass'
    grunt.loadNpmTasks 'grunt-contrib-jade'
    grunt.loadNpmTasks 'grunt-contrib-connect'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.registerTask 'default', ['connect', 'watch']
