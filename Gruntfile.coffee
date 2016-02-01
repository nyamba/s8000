module.exports = (grunt) ->
  pd = global.p_dir + '/'
  grunt.initConfig
    sass:
      dist:
        options:
          sourcemap: 'none'
          noCache: true
        files: [
          expand: true,
          cwd:    pd+'sass',
          src:    ['*.sass']
          dest:   pd+'app/css'
          ext:    '.css'
        ]
    jade:
      compile:
        options :
          pretty: true
        files: [
          expand: true,
          cwd:    pd+'jade',
          src:    ['*.jade']
          dest:   pd+'app'
          ext:     '.html'
        ]
    connect:
      server:
        options:
          livereload: true
          base: [pd+'app']
    watch:
      options:
        livereload: true
        spawn: false
      html:
        files: [pd+'jade/*.jade']
        tasks: ['jade']
      css:
        files: [pd+'sass/*.sass']
        tasks: ['sass']

    grunt.loadNpmTasks 'grunt-contrib-sass'
    grunt.loadNpmTasks 'grunt-contrib-jade'
    grunt.loadNpmTasks 'grunt-contrib-connect'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.registerTask 'default', ['connect', 'watch']
