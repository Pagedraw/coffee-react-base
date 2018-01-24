require('coffeescript/register');

// from https://github.com/jashkenas/coffeescript/blob/master/src/repl.coffee#L184
let path = require('path');
let transpile_opts = {
    transpile: {filename: path.resolve(process.cwd(), '<repl>')}
};

let Module = require('module');
let originalModuleLoad = Module.prototype.load;
Module.prototype.load = function(filename) {
    this.options = transpile_opts;
    return originalModuleLoad.call(this, filename);
};

// remnant of coffee-react: many of our files still have the now-unsupported .cjsx file extension
require.extensions['.cjsx'] = require.extensions['.coffee']
