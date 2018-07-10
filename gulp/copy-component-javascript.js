const gulp = require('gulp');

gulp.task('copy-component-javascript', function () {
  return gulp.src([
    'src/components/**/*.js'
  ])
  .pipe(gulp.dest('public/javascripts/components/'))
});