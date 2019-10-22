#import <Cordova/CDVPlugin.h>
#import <WebKit/WebKit.h>

@interface ExternalScreen : CDVPlugin

@property (nonatomic, strong)UIWindow* externalWindow;
@property (nonatomic, strong) WKWebView* externalWebView;

- (void)checkAvailability:(CDVInvokedUrlCommand*)command;
- (void)invokeJavaScript:(CDVInvokedUrlCommand*)command;
- (void)loadHTML:(CDVInvokedUrlCommand*)command;
- (WKWebView*) getWebView;

@end
