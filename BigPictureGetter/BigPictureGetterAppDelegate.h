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
    UIButton *button;
    UILabel *urlLabel;
    UILabel *htmlOutput;
    NSString *url;
}

- (IBAction)getUrl:(id)sender;
- (void)loadUrl;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) IBOutlet UILabel *urlLabel;
@property (nonatomic, retain) IBOutlet UILabel *htmlOutput;

@end
