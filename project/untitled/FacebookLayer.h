//
//  FacebookLayer.h
//  untitled
//

#import "cocos2d.h"
#import "AppDelegate.h"

@interface FacebookLayer : CCLayer
{
    AppDelegate* app;
    CCLabelTTF *label;
    CCMenuItemFont *item;
    CCMenuItemFont *item1;
}

+(CCScene *) scene;

@end
