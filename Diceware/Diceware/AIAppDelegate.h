//
//  AIAppDelegate.h
//  Diceware
//
//  Created by Asim Ihsan on 28/10/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "Constants.h"

@class AIPasswordViewController;

@interface AIAppDelegate : UIResponder <UIApplicationDelegate>
{

}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) AIPasswordViewController *passwordViewController;

@end
