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
    UILabel *htmlOutput;
}

- (NSString *)getHtml;
- (NSMutableArray *)getImageURLsFromHtml:(NSString *)html;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UILabel *htmlOutput;

@end
