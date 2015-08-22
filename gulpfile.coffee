gulp    = require 'gulp'
coffee  = require 'gulp-coffee'
rimraf  = require 'rimraf'
Mocha   = require 'mocha'
readdir = require 'recursive-readdir-sync'

paths =
    build: "build"
    lib:   "lib"

gulp.task 'clearscreen', ->
    console.log '\u001B[2J\u001B[0;0f'

gulp.task 'clean', ->
    rimraf.sync paths.build

gulp.task 'build', ['clean'], ->
    gulp.src 'lib/**/*.coffee'
        .pipe coffee()
        .pipe gulp.dest paths.build

gulp.task 'watch', ->
    watch paths.lib
        .pipe coffee()
        .pipe gulp.dest paths.build

gulp.task 'test', ->
    files = readdir('./tests').filter (file) -> /spec\.coffee$/.test file
    mocha = new Mocha
    for spec in files
        mocha.addFile "./#{spec}"
    mocha.run (failures) ->
        console.log failures

gulp.task 'default', ['clearscreen', 'build']
