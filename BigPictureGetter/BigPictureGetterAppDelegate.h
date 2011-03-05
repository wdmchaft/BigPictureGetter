//
//  BigPictureGetterAppDelegate.h
//  BigPictureGetter
//
//  Created by Donal Ellis on 4/03/11.
//  Copyright 2011 ACER. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *const BigPictureURL;

@interface BigPictureGetterAppDelegate : NSObject <UIApplicationDelegate> {
    UIImageView *imageView;
}

- (NSData *)getHtmlData;
- (NSArray *)getImageURLsFromHtml:(NSData *)html;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;

@end
