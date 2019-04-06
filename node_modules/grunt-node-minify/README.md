[![NPM Version](https://img.shields.io/npm/v/grunt-node-minify.svg)](https://www.npmjs.com/package/grunt-node-minify)
[![Build Status](https://travis-ci.org/mach6/grunt-node-minify.svg?branch=master)](https://travis-ci.org/mach6/grunt-node-minify)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/d7651007f77b403f918699657c4a711d)](https://www.codacy.com/app/dougsimmons/grunt-node-minify?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=mach6/grunt-node-minify&amp;utm_campaign=Badge_Grade)

[![Dependency Status](https://david-dm.org/mach6/grunt-node-minify/status.svg)](https://david-dm.org/mach6/grunt-node-minify)
[![devDependency Status](https://david-dm.org/mach6/grunt-node-minify/dev-status.svg)](https://david-dm.org/mach6/grunt-node-minify?type=dev)

# grunt-node-minify

Grunt plugin for [node-minify](https://github.com/srod/node-minify)

## Getting Started
This plugin requires Grunt `>=1.0.0`

If you haven't used [Grunt](http://gruntjs.com/) before, be sure to check out the [Getting Started](http://gruntjs.com/getting-started) guide, as it explains how to create a [Gruntfile](http://gruntjs.com/sample-gruntfile) as well as install and use Grunt plugins. Once you're familiar with that process, you may install this plugin with this command:

```shell
npm install grunt-node-minify --save-dev
```

Once the plugin has been installed, it may be enabled inside your Gruntfile with this line of JavaScript:

```js
grunt.loadNpmTasks('grunt-node-minify');
```

## The "grunt-node-minify" task

### Overview
In your project's Gruntfile, add a section named `node-minify` to the data object passed into `grunt.initConfig()`.

```js
grunt.initConfig({
  'node-minify': {
    your_task: {
      compressor: '',     // Optional, defaults to `gcc`
      sync: '',           // Optional, defaults to `false`
      buffer: '',         // Optional, defaults to `(1024 * 1000)`
      publicFolder: '',   // Optional, defaults to `undefined`
      options: {
        // Optional, compressor specific options go here. See node-minify.
      },
      your_target: {
        // Target-specific file lists and/or options go here.
      }
    }
  }
});
```

### Options
See [node-minify](https://github.com/srod/node-minify) for compressors and compressor `options {...}` which can be
specified.

### Usage Examples

#### Default Options
In this example, the default options are used to minify javascript files recursively found in `src/` to the file `dest/gcc.min.js`, using _google-closure-compiler-js_.

```js
grunt.initConfig({
  'node-minify': {
    gcc: {
      files: {
        'dest/gcc.min.js': ['src/**/*.js']
      }
    }
  }
});
```

#### Custom Options
In this example, custom options are used to minify javascript files recursively found in the `publicFolder` (src) to the file `dest/uglifyjs.min.js`, using _uglifyjs_ with `options { .. }`.

```js
grunt.initConfig({
  'node-minify': {
    uglifyjs: {
      compressor: 'uglifyjs',
      publicFolder: 'src/',
      options: {
        warnings: true,
        mangle: false,
        compress: false
      }
      files: {
        'dest/uglifyjs.min.js':  ['**/*.js']
      }
    }
  }
});
```

## Contributing
In lieu of a formal style guide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality. Lint and test your code using [Grunt](http://gruntjs.com/).

## Release History
- _1.5.0_ : Updates dependencies (google-closure-compiler-js).
- _1.4.0_ : Updates dependencies (node-minify, google-closure-compiler-js, and others).
- _1.3.6_ : Updates dependencies (google-closure-compiler-js).
- _1.3.5_ : Updates dependencies (google-closure-compiler-js).
- _1.3.4_ : Updates dependencies (google-closure-compiler-js).
- _1.3.3_ : Updates dependencies (google-closure-compiler-js).
- _1.3.2_ : Updates dependencies (node-minify).
- _1.3.1_ : Updates dependencies (chalk).
- _1.3.0_ : Updates dependencies (node-minify, chalk).
- _1.2.4_ : Updates dependencies (google-closure-compiler-js, node-minify).
- _1.2.3_ : Updates dependencies (google-closure-compiler-js).
- _1.2.2_ : Updates dependencies (google-closure-compiler-js, chalk).
- _1.2.1_ : Updates dependencies.
- _1.2.0_ : Remove bluebird dependency. Fix bugs.
- _1.1.7_ : Updates dependencies (node-minify).
- _1.1.6_ : Updates dependencies.
- _1.1.5_ : Updates dependencies.
- _1.1.4_ : Updates dependencies.
- _1.1.3_ : Updates dependencies.
- _1.1.2_ : Updates dependencies.
- _1.1.1_ : Updates dependencies.
- _1.1.0_ : Adds color to console output.
- _1.0.1_ : Initial release.

## License
[MIT](LICENSE)
