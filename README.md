# Cordova WKWebView External Screen plugin

A super basic Cordova plugin for displaying and interacting with an HTML document on an external screen via AirPlay or HDMI adapter utilizing the WKWebView in iOS 8+. 

([cordova-plugin-wkwebview-engine](https://github.com/apache/cordova-plugin-wkwebview-engine) must be installed separately)

### [Example iOS App](https://github.com/josiaho/ExternalScreen-iOS)

## Installation

### With cordova-cli

If you are using [cordova-cli](https://github.com/apache/cordova-cli), install
with:

    cordova plugin add cordova-plugin-wkwebview-external-screen
    
Or directly from this repo:

    cordova plugin add https://github.com/josiaho/cordova-plugin-wkwebview-external-screen.git


## Usage

The plugin is available under the global `ExternalScreen` object.

Example:

    ExternalScreen.checkAvailability(function (isAvailable) {
    	if (isAvailable) { // If an external screen is available
    		ExternalScreen.loadHTML('secondary.html'); // Load document
    	}
    })

### .checkAvailability
Determines whether an External Screen is currently available (via AirPlay mirroring or HDMI adapter)

    ExternalScreen.checkAvailability(function (isAvailable) {
    	alert(isAvailable) // true or false
    })

### .loadHTML
The .html file you would like to display on the External Screen (the file must be located in your app's `www` directory).

    ExternalScreen.loadHTML('secondary.html');
    
*(This method will fail if external screen is unavailable)*

### .invokeJavaScript

Communicate with the external page by sending scripts which will be evaluated:

    ExternalScreen.invokeJavaScript('myFunction("Hello World")');

The script needs to be serialized to a string. Any values you pass should also be serialized before calling `invokeJavaScript()`.

*(This method will fail if external screen is unavailable)*

## Credits
Inspired by [ExternalScreen-iOS](https://github.com/pearj/ExternalScreen-iOS)