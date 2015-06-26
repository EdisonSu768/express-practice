path = require 'path'

module.exports = (grunt) ->

#  APP_PATH = __dirname
  # register tasks
  grunt.loadNpmTasks 'grunt-contrib-coffee' # compile coffee to js

  grunt.loadNpmTasks 'grunt-contrib-clean'  # clean the specified directory

  grunt.loadNpmTasks 'grunt-contrib-watch'  # watch

  grunt.loadNpmTasks 'grunt-express-server' # express server

  grunt.loadNpmTasks 'grunt-mocha-test'     # mocha test

  grunt.initConfig
    coffee:
      development:
        files: [
          expand: true
          cwd: './app/assets/coffeescripts'
          src: ['*.coffee']
          dest: './public/javascripts/'
          ext: '.js'
        ]
    clean:
      development: ['./public/javascripts/*.js']
#    watch:
#      development:
#        files: ['./app/controllers/*.coffee', './app/assets/coffeescripts/*.coffee'],
#        task: ['express:development'],
#        options:
#          event: ['changed']
#          reload: true
#    express:
#      development:
#        options:
#          spawn: false

    mochaTest:
      controllers:
        options:
          require: [
            'coffee-script/register',
            'test/init.coffee',
          ]
          reporter: 'mocha-jenkins-reporter'

        src: ['./test/backend/controllers/*_controllers.test.coffee']

  grunt.registerTask 'test:development', [
    'clean:development'
    'coffee:development'
  ]

  grunt.registerTask 'test:controllers', [
    'mochaTest:controllers'
  ]
