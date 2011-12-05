//
//  AppDelegate.h
//  untitled
//

#import <UIKit/UIKit.h>
#import "FBConnect.h"

//facebook
#define kFBAppId                    @"xxxxx"                    //REPLACE ME
#define kFBAppSecret                @"xxxxx"                    //REPLACE ME

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate, FBRequestDelegate, FBDialogDelegate, FBSessionDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
    
    //facebook
    Facebook* _facebook;
    NSArray* _permissions;
    NSNumber *facebookState;//0,1,2 でログイン状態をメモログイン前、ログイン後、つぶやき終了
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) Facebook *_facebook;

-(NSNumber *) facebook:(NSString*)s;

@end
