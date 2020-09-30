#import "WKWebViewExternalScreen.h"
#import <Cordova/CDVPluginResult.h>

@implementation ExternalScreen

- (void)checkAvailability:(CDVInvokedUrlCommand*)command
{
    BOOL result = ([[UIScreen screens] count] > 1);
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (WKWebView*)getWebView {
    if (!self.externalWebView) {
        UIScreen* externalScreen = [[UIScreen screens] objectAtIndex: 1];
        CGRect screenBounds = externalScreen.bounds;

        self.externalWebView = [[WKWebView alloc] initWithFrame: screenBounds
                                                  configuration: [[WKWebViewConfiguration alloc] init]];
        self.externalWindow = [[UIWindow alloc] initWithFrame: screenBounds];

        self.externalWindow.screen = externalScreen;
        self.externalWindow.clipsToBounds = YES;
        [self.externalWindow addSubview:self.externalWebView];
        [self.externalWindow makeKeyAndVisible];
        self.externalWindow.hidden = NO;
    }
    return self.externalWebView;
}

- (void)invokeJavaScript:(CDVInvokedUrlCommand*)command
{
    if ([[UIScreen screens] count] > 1) {
        NSArray *arguments = command.arguments;
        NSString *stringObtainedFromJavascript = [arguments objectAtIndex:0];
        [[self getWebView] evaluateJavaScript:stringObtainedFromJavascript completionHandler:nil];
    }
}

- (void)loadHTML:(CDVInvokedUrlCommand*)command {
    if ([[UIScreen screens] count] > 1) {
        NSArray *arguments = command.arguments;
        NSString *file = [arguments objectAtIndex:0];
        
        NSString* baseURLAddress = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"www"];
        NSString* a = @"file://";
        baseURLAddress = [a stringByAppendingString:baseURLAddress];
        NSString* path = [NSString stringWithFormat:@"%@/%@", baseURLAddress, file];
        NSURL *nsurl = [NSURL URLWithString:[path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        // NSURL *nsurl=[NSURL URLWithString:path];
        NSURLRequest *request=[NSURLRequest requestWithURL:nsurl];
        [[self getWebView] loadRequest: request];
        CDVPluginResult *result = [CDVPluginResult resultWithStatus: CDVCommandStatus_OK];
        [self.commandDelegate sendPluginResult: result
                                    callbackId: command.callbackId];
    }
}

@end
