var gulp = require('gulp');
var less = require('gulp-less');
var coffee = require('gulp-coffee');
var gutil = require('gulp-util');

gulp.task('default', ['copy', 'less', 'javascript']);

gulp.task('copy', function() {
  gulp.src('./src/html/**/*.html')
    .pipe(gulp.dest('./target/html'));
});

gulp.task('javascript', function() {
  gulp.src('./src/coffee/**/*.coffee')
    .pipe(coffee().on('error', gutil.log))
    .pipe(gulp.dest('./target/js'));
});

gulp.task('less', function() {
  gulp.src('./src/less/main.less')
    .pipe(less())
    .pipe(gulp.dest('./target/css'));
});
