//  ----------------------------------------------------------------------------
//  AIRandomManager.h
//  Diceware
//
//  Created by Asim Ihsan on 08/01/2012.
//  Copyright (c) 2012 All rights reserved.
//  ----------------------------------------------------------------------------

//  ----------------------------------------------------------------------------
//  Singleton class responsible for generating cryptographically secure
//  random data, especially integer ranges. It will initialize itself.
//
// References:
//
// Official Apple docs on Singletons:
// http://tinyurl.com/3dymt3r
//
// Getting rid of warnings in official Singleton pattern:
// http://stackoverflow.com/questions/5494981/use-case-of-oneway-void-in-objective-c
//  ----------------------------------------------------------------------------

#import <Foundation/Foundation.h>
#import "cryptopp561/osrng.h"
#import <Security/Security.h>
#import "Constants.h"

@interface AIRandomManager : NSObject
{
    CryptoPP::AutoSeededRandomPool rng;
}

+ (AIRandomManager *)getInstance;

@end
