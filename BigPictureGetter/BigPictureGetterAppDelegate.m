//
//  BigPictureGetterAppDelegate.m
//  BigPictureGetter
//
//  Created by Donal Ellis on 4/03/11.
//  Copyright 2011 ACER. All rights reserved.
//

#import "BigPictureGetterAppDelegate.h"

#include <libxml/HTMLparser.h>

#import "TFHpple.h"

NSString *const BigPictureURL = @"http://www.boston.com/bigpicture/";

@implementation BigPictureGetterAppDelegate


@synthesize window=_window;
@synthesize imageView;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    
    [self getImageURLsFromHtml:[self getHtmlData]];
    
    return YES;
}

- (NSArray *)getImageURLsFromHtml:(NSData *)htmlData
{
    // NSMutableArray *imageUrls = [[NSMutableArray alloc] init];
    // parse html    
    TFHpple *parser = [[TFHpple alloc] initWithHTMLData:htmlData];

    NSArray *imageUrls = [parser search:@"//img[@class='bpImage']"];
    
//    int i = 0;
//    for (i = 0; i < [imageUrls count]; i++) {
//        NSLog(@"%@", [[imageUrls objectAtIndex:i] objectForKey:@"src"]);
//    }
    
    NSString *firstImageUrlString = [[imageUrls objectAtIndex:0] objectForKey:@"src"];
    NSLog(@"%@", firstImageUrlString);
    
    NSURL *firstImageUrl = [NSURL URLWithString:firstImageUrlString];
    
    UIImage *firstImage = [[UIImage alloc] initWithData: [NSData dataWithContentsOfURL: firstImageUrl]];
    NSLog(@"%@", firstImage);
    
    [self.imageView setImage:firstImage];
    
    // release it now as it's no longer required
    [firstImage release];
    [parser release];
    
    return imageUrls;
}

- (NSData *)getHtmlData
{
    NSLog(@"application loaded");
    NSURL *url = [NSURL URLWithString:BigPictureURL];
    NSLog(@"%@", [url absoluteString]);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSLog(@"%@", request);
    [request setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
    if ([request respondsToSelector:@selector(allHTTPHeaderFields)]) {
        NSDictionary *requestHeaders = [request allHTTPHeaderFields];
        NSLog(@"%@", [requestHeaders description]);
    }
    NSHTTPURLResponse *response;
    NSError *error = nil;
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if ([response respondsToSelector:@selector(allHeaderFields)]) {
        NSDictionary *responseHeaders = [response allHeaderFields];
        NSLog(@"%@", [responseHeaders description]);
    }
    
    if (data != nil) {
        NSString *dataAsString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        if (!dataAsString) {
            dataAsString = [[NSString alloc] initWithData:data encoding:NSISOLatin1StringEncoding];
        }
        // no need to try NSASCIIStringEncoding as NSUTF8StringEncoding includes it,
        // see http://www.mikeash.com/pyblog/friday-qa-2010-02-19-character-encodings.html
        if (!dataAsString) {
            dataAsString = [[NSString alloc] initWithData:data encoding:NSMacOSRomanStringEncoding];
        }
        
//        [self.htmlOutput setText:@"page loaded"];
        
//        return dataAsString;
        
        return data;
        
//        [dataAsString release];
    } else {
//        [self.htmlOutput setText:@"Can't access page"];
        NSLog(@"%@", error);
        
        return nil;
    }
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

@end
