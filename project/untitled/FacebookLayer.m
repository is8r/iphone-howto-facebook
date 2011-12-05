//
//  FacebookLayer.m
//  untitled
//

#import "FacebookLayer.h"

@implementation FacebookLayer

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	FacebookLayer *layer = [FacebookLayer node];
	[scene addChild: layer];
	return scene;
}

-(id) init
{
	if( (self=[super init])) {
		
        //
		CGSize size = [[CCDirector sharedDirector] winSize];
        
        //add button
        item = [CCMenuItemFont itemFromString: @"LOGIN" target:self selector:@selector(onPress:)];
        item.position =  ccp( 0 , 0 );
        [item setFontName:@"Helvetica-Bold"];
        [item setFontSize:16];
        item1 = [CCMenuItemFont itemFromString: @"LOGOUT" target:self selector:@selector(onPressLogout:)];
        item1.position =  ccp( 0 , -50 );
        [item1 setFontName:@"Helvetica-Bold"];
        [item1 setFontSize:16];
        CCMenu *menu = [CCMenu menuWithItems:item, item1, nil];
        [self addChild: menu];
        
        //add label
		label = [CCLabelTTF labelWithString:@"LOGIN" fontName:@"Helvetica" fontSize:12];
		label.position =  ccp( size.width/2 , size.height/2 - 150 );
		[self addChild: label];
        
        [[NSUserDefaults standardUserDefaults] synchronize];
        app = (AppDelegate *)[UIApplication sharedApplication].delegate;
        
        //
        [self schedule:@selector(check:) interval: 1];
	}
	return self;
}

-(void) onPress:(id)sender
{
    [app facebook:[NSString stringWithFormat: @"twit:%@", [NSDate date]]];
    
}
-(void) onPressLogout:(id)sender
{
    [app facebook:@"logout"];
}

//ログイン、つぶやき状況を表示
- (void) check:(ccTime)dt
{
    int num = [[app facebook:@""] intValue];
    
    //NSLog(@"%i", num);
    if(num == 2) {
        [item setString:@"TNX!"];
        [label setString:@"つぶやき完了"];
        [self unschedule:@selector(check:)];
    } else if(num == 1) {
        [item setString:@"POST FACEBOOK!"];
        [label setString:@"ログイン中→ウォールに投稿する"];
        [item1 setIsEnabled:YES];
    } else {
        [item setString:@"LOGIN"];
        [label setString:@"ログイン前→認証画面表示"];
        [item1 setIsEnabled:NO];
    }
}

-(void) dealloc
{
	[super dealloc];
}
@end
