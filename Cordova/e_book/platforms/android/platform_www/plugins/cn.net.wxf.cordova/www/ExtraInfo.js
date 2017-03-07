cordova.define("cn.net.wxf.cordova.ExtraInfo", function(require, exports, module) {
var exec = require('cordova/exec');

exports.getExtra = function(success, error) {
    exec(success, error, "ExtraInfo", "getExtra", []);
};
});
