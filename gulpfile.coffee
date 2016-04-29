gulp = require('gulp')
sass = require('gulp-ruby-sass')
autoprefixer = require('gulp-autoprefixer')
broeserSync = require('browser-sync');

gulp.task 'scss', ->
  return sass('sass/**/*.scss')
    .pipe autoprefixer()
    .pipe gulp.dest('./css/')
    .pipe broeserSync.reload({stream:true})

gulp.task 'browser-sync', ['scss', 'rebuild'], ->
  broeserSync({
    server: {
      baseDir: './'
    }
  })

gulp.task 'rebuild', ->
  broeserSync.reload()

gulp.task 'watch', ->
  gulp.watch('**/*.scss', ['scss'])
  gulp.watch(['**/*.html'], ['rebuild'])

gulp.task 'default', ['browser-sync', 'watch']