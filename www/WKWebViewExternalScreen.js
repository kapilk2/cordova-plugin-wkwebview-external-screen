
var ExternalScreen = {
	checkAvailability: function (success, fail) {
		cordova.exec(success, fail, "ExternalScreen", 'checkAvailability', []);
	},
	loadHTML: function (fileURL, success, fail) {
		cordova.exec(success, fail, "ExternalScreen", 'loadHTML', [fileURL]);
	},
	invokeJavaScript: function (str, success, fail) {
		cordova.exec(success, fail, "ExternalScreen", 'invokeJavaScript', [str]);
	}
};

module.exports = ExternalScreen;
