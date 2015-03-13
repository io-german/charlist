var gulp = require('gulp');
var less = require('gulp-less');
var coffee = require('gulp-coffee');
var gutil = require('gulp-util');
var concat = require('gulp-concat');

gulp.task('build', ['copy', 'less', 'dependencies', 'javascript']);

gulp.task('watch', function() {
  gulp.watch('./src/**/*.*', ['build']);
});

gulp.task('copy', function() {
  gulp.src('./src/html/**/*.html')
    .pipe(gulp.dest('./target/html'));
});

gulp.task('javascript', function() {
  gulp.src('./src/coffee/**/*.coffee')
    .pipe(coffee().on('error', gutil.log))
    .pipe(concat('app.js'))
    .pipe(gulp.dest('./target/js'));
});

gulp.task('less', function() {
  gulp.src('./src/less/main.less')
    .pipe(less())
    .pipe(gulp.dest('./target/css'));
});

gulp.task('dependencies', function() {
  gulp.src('./node_modules/react/dist/react.js')
    .pipe(gulp.dest('./target/js/lib'))
});


