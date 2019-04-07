module.exports = function (grunt) {

    grunt.loadNpmTasks('grunt-contrib-less');
    grunt.loadNpmTasks('grunt-node-minify');
    grunt.loadNpmTasks('grunt-contrib-watch');

    grunt.initConfig({
        less: {
            development: {
                options: {
                    compress: true,
                    yuicompress: true,
                    optimization: 2
                },
                files: {
                    "web/header/header.css": "web/header/header.less",
                    "web/home/home-hero.css": "web/home/home-hero.less"
                }
            }
        },
        'node-minify': {
            gcc: {
                files: {
                    'web/header/header.min.js': ['web/header/header.js']
                }
            }
        },
        watch: {
            styles: {
                files: [
                    'less/**/*.less'
                ], // which files to watch
                tasks: [
                    'less'
                ],
                options: {
                    nospawn: true
                }
            },
            scripts: {
                files: ['**/*.js']
            }
        }
    });

    grunt.registerTask('default', ['less', 'node-minify', 'watch']);
};