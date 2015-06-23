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
            './test/init.coffee',
          ]
          reporter: 'mocha-jenkins-reporter'

        src: ['./test/controllers/*_controllers.test.coffee']

  grunt.registerTask 'test:development', [
    'clean:development'
    'coffee:development'
  ]

  grunt.registerTask 'test:controllers', [
    'mochaTest:controllers'
  ]















#fs = require 'fs'
#jade = require 'jade'
#util = require 'util'
#
#module.exports = (grunt) ->
#
#  # register external tasks
#  grunt.loadNpmTasks 'grunt-contrib-coffee'
#  grunt.loadNpmTasks 'grunt-contrib-clean'
#  grunt.loadNpmTasks 'grunt-mocha-test'
#  grunt.loadNpmTasks 'grunt-env'
#  grunt.loadNpmTasks 'grunt-debug-task'
#  grunt.loadNpmTasks 'grunt-contrib-less'
#  grunt.loadNpmTasks 'grunt-express-server'
#  grunt.loadNpmTasks 'grunt-mkdir'
#  grunt.loadNpmTasks 'grunt-shell'
#  grunt.loadNpmTasks 'grunt-contrib-jshint'
#  grunt.loadNpmTasks 'grunt-coffeelint'
#  grunt.loadNpmTasks 'grunt-docco'
#  grunt.loadNpmTasks 'grunt-contrib-copy'
#  grunt.loadNpmTasks 'grunt-subgrunt'
#
#  BUILD_PATH = 'public/build/'
#  APP_PATH = 'app'
#
#  DEV_BUILD_PATH = "#{BUILD_PATH}/development"
#  PRODUCTION_BUILD_PATH = "#{BUILD_PATH}/production"
#
#
#  COMPILE_EXCLUE = [
#
#  ]
#
#  grunt.initConfig
#    shell:
#      buildVerifySignTool:
#        command: './verifysign.sh'
#
#      frontEndTotalTest:
#        command: 'python karmaReport.py'
#
#      replaceCoffee:
#        command: './replaceCoffee.sh start'
#
#      recoverCoffee:
#        command: './replaceCoffee.sh end'
#
#      coverageCoffee:
#        command: './replaceCoffee.sh coverage'
#
#      loadSchema:
#        command: './DEV coffee es/loadSchema.coffee'
#
#      loadTemplate:
#        command: 'cd ESTools/basic; ./applyTemplates.sh $ELASTICSEARCH_PORT_9200_TCP_ADDR $ELASTICSEARCH_PORT_9200_TCP_PORT'
#
#      karmaRun:
#        command: './karmarun.sh'
#
#      e2eRun:
#        command: "python e2e.py"
#
#      coverageBackend:
#        command: "./script/unittest"
#        options:
#          stdout: true
#
#      coffeelintFront:
#        command: 'cd tools/webtool; ./codelint.sh; cd -'
#
#      doccoFront:
#        command: './tools/webtool/genDoc.sh'
#
#    env:
#      test_production_api:
#        JUNIT_REPORT_PATH: "build/report/production_api.xml"
#        JUNIT_REPORT_STACK: 1
#
#        NODE_ENV: "test"
#
#      test_api:
#        JUNIT_REPORT_PATH: "build/report/api.xml"
#        JUNIT_REPORT_STACK: 1
#
#        NODE_ENV: "test"
#
#      test_auth:
#        JUNIT_REPORT_PATH: "build/report/auth.xml"
#        JUNIT_REPORT_STACK: 1
#
#        NODE_ENV: "test"
#
#      test_controllers:
#        JUNIT_REPORT_PATH: "build/report/controllers.xml"
#        JUNIT_REPORT_STACK: 1
#
#        NODE_ENV: "test"
#
#
#      test_models:
#        JUNIT_REPORT_PATH: "build/report/models.xml"
#        JUNIT_REPORT_STACK: 1
#
#        NODE_ENV: "db_test"
#
#      test_schedule:
#        JUNIT_REPORT_PATH: "build/report/schedule.xml"
#        JUNIT_REPORT_STACK: 1
#
#      test_config:
#        JUNIT_REPORT_PATH: "build/report/config.xml"
#        JUNIT_REPORT_STACK: 1
#
#      test_package:
#        JUNIT_REPORT_PATH: "build/report/package.xml"
#        JUNIT_REPORT_STACK: 1
#
#
#    mkdir:
#      all:
#        options:
#          create: ['build/report']
#
#    clean:
#      development: [DEV_BUILD_PATH]
#      production: [PRODUCTION_BUILD_PATH]
#
#    coffee:
#      development:
#        options:
#          sourceMap: true
#        files: [
#          expand: true
#          cwd: "#{APP_PATH}/assets/coffeescripts"
#          dest: "public/javascripts"
#          src: ["*.coffee", "**/*.coffee"]
#          ext: ".js"
#        ]
#
#      backend:
#        options:
#          sourceMap: true
#        files: [
#          expand: true
#          cwd: "./"
#          dest: "build/js"
#          src: [
#            "**/*.coffee"
#            "!node_modules/**"
#            "!bower_components/**"
#            "!app/assets/**"
#            "!privateCloud/**"
#            "!test/**"
#            "!build/**"
#            "!public/**"
#          ]
#          ext: ".js"
#        ]
#
#    express:
#      development:
#        options:
#          script: 'app.js'
#          output: "Compound server listening on .+ within .+ environment"
#
#    less:
#      development:
#        options:
#          sourceMap: true
#        files: [
#          expand: true
#          cwd: "#{APP_PATH}/assets/stylesheets"
#          dest: "public/stylesheets"
#          src: ["*.less"]
#          ext: ".css"
#        ]
#
#    # run tests with mocha test
#    mochaTest:
#      controllers:
#        options:
#          require: 'test/init.js'
#          reporter: 'mocha-jenkins-reporter'
#        src: ['test/controllers/*.test.js']
#      models:
#        options:
#          require: 'test/init.js'
#          reporter: 'mocha-jenkins-reporter'
#        src: ['test/models/*.test.js', 'test/models/*.test.coffee']
#      schedule:
#        options:
#          require: 'test/init.js'
#          reporter: 'mocha-jenkins-reporter'
#        src: ['test/scheduling/*.test.coffee']
#      config:
#        options:
#          reporter: 'mocha-jenkins-reporter'
#        src: ['test/config/*.test.coffee']
#      api:
#        options:
#          require: 'test/init.js'
#          reporter: 'mocha-jenkins-reporter'
#        src: ['test/api/*.coffee']
#
#      package:
#        options:
#          require: 'test/init.js'
#          reporter: 'mocha-jenkins-reporter'
#        src: ['test/package/*.coffee']
#
#      production_api:
#        options:
#          require: 'test/init.js'
#          reporter: 'mocha-jenkins-reporter'
#        src: ['test/production_api/*.coffee']
#
#
#    jshint:
#      files: ['test/**/*.js']
#      options:
#        globals:
#          exports: true
#
#    coffeelint:
#      app: ['app/**/*.coffee', 'app/../es/*.coffee']
#      tests:
#        files:
#          src: ['tests/**/*.coffee']
#
#    docco:
#      debug:
#        src: ['app/assets/coffeescripts/*.coffee', 'app/../es/*.coffee']
#        options:
#          output: 'docs/'
#
#    watch:
#      browser_less:
#        files: "app/assets/**/*.less"
#        tasks: 'less:development'
#
#      browser_coffee:
#        files: "app/assets/**/*.coffee"
#        tasks: 'coffee:development'
#
#      server_coffee:
#        files: ["**/*.coffee", "!app/assets/**", "!Gruntfile.coffee","es/**"]
#        tasks: 'express:development'
#        options:
#          spawn: false
#
#
#    copy:
#      backend:
#        files: [
#          expand: true
#          src: [
#            "**/*.js"
#            "!node_modules/**"
#            "!test/**"
#            "!build/**"
#            "!privateCloud/**"
#            "!app/assets/**"
#            "!bower_components/**"
#            "!public/**"
#          ]
#          dest: 'build/js'
#        ]
#
#      all:
#        options:
#          mode: true
#        files: [
#            expand: true
#            dot: true
#            cwd: "./"
#            src: ["**", "!**/*.coffee", "!test/**", "!build/**", "!.git/**",
#            "!privateCloud/**", "!upgrade/**", "!uploadFiles/**", "!autodbgen/**", "!coverage"]
#            dest: 'build/source'
#          ,
#            expand: true
#            dot: true
#            cwd: "./"
#            src: ["app/assets/**"]
#            dest: 'build/source'
#        ]
#
#      js:
#        files: [
#          expand: true
#          cwd: "build/js2/"
#          src: ["**/*.js"]
#          dest: 'build/source'
#        ]
#
#
#    uglify:
#      backend:
#        files:[
#          expand: true
#          cwd: "build/js/"
#          src: ["**/*.js"]
#          dest: "build/js2/"
#        ]
#
#    subgrunt:
#      backend:
#        options:
#          npmClean: true
#        projects:
#          "build/source": ["noop"]
#
#  # start app server before task; close app server after.
#  grunt.registerServerTask = (name, before_tasks, after_tasks) ->
#    server_start_tasks = [
#      'development'
#      'express:development'
#    ]
#
#    server_stop_tasks = [
#      'express:development:stop'
#    ]
#
#    total_tasks = _(before_tasks)
#    .concat(server_start_tasks)
#    .concat(after_tasks)
#    .concat(server_stop_tasks)
#    .compact()
#    .valueOf()
#
#    grunt.registerTask name, total_tasks
#
#  grunt.registerTestTask = (name, tasks_config) ->
#
#    before_tasks = tasks_config.before || []
#    after_tasks = tasks_config.after || []
#
#    grunt.registerServerTask name, before_tasks, after_tasks
#
#  grunt.registerTask 'test:back', [
#    "shell:coverageBackend"
#  ]
#
#  grunt.registerTask 'test:front', [
#    'shell:doccoFront'
#    'test:controllers'
#    'test:karmarun'
#    'shell:frontEndTotalTest'
#    'shell:coffeelintFront'
#  ]
#
#  grunt.registerTask 'test:e2e', [
#    'shell:e2eRun'
#  ]
#
#  grunt.registerTestTask 'test:production_api',
#    before:['mkdir:all','env:test_production_api']
#    after:['mochaTest:production_api']
#
#  grunt.registerTestTask 'test:controllers',
#    before: ['mkdir:all', 'env:test_controllers']
#    after: ['mochaTest:controllers']
#
#  grunt.registerTestTask 'test:karmarun',
#    before: ['mkdir:all']
#    after: ['shell:karmaRun']
#
#  grunt.registerTask 'test:api',
#    ['mkdir:all', 'env:test_api', 'mochaTest:api']
#
#  grunt.registerTask 'test:models',
#    ['mkdir:all', 'env:test_models', 'mochaTest:models']
#
#  grunt.registerTask 'test:schedule',
#    ['mkdir:all', 'env:test_schedule', 'mochaTest:schedule']
#
#  grunt.registerTask 'test:config',
#      ['mkdir:all', 'env:test_config', 'mochaTest:config']
#
#  grunt.registerTask 'test:package',
#    ['mkdir:all', 'env:test_package', 'mochaTest:package']
#
#  grunt.registerTask 'development', [
#    'clean:development'
#    'coffee:development'
#    'less:development'
#  ]
#
#  grunt.registerTask 'default', [
#    'development'
#    'express:development'
#    'watch'
#  ]
#
#  grunt.registerTask 'buildCoffee', [
#    'coffee:development'
#  ]
#
#  grunt.registerTask 'buildLess', [
#    'less:development'
#  ]
#
#  grunt.registerTask 'coverage', [
#    'shell:replaceCoffee'
#    'shell:coverageCoffee'
#    'shell:recoverCoffee'
#  ]
#
#  grunt.registerTask 'buildVerifySignTool',[
#    'shell:buildVerifySignTool'
#  ]
#
#  grunt.registerTask 'compile:backend',[
#    "coffee:backend"
#    "copy:backend"
#    "uglify:backend"
#    "copy:all"
#    "copy:js"
#    "subgrunt:backend"
#  ]
#
#  grunt.registerTask "noop", []
