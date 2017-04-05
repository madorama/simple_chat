var gulp = require("gulp");
var plumber = require("gulp-plumber");
var coffee = require("gulp-coffee");

gulp.task("coffee", function() {
  gulp.src("src/**/*.coffee")
    .pipe(plumber())
    .pipe(coffee())
    .pipe(gulp.dest("../public/"))
});

gulp.task("watch", function() {
  gulp.watch("src/**/*.coffee", ["coffee"])
});

gulp.task("default", ["coffee", "watch"]);
