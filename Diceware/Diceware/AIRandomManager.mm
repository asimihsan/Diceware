//  ----------------------------------------------------------------------------
//  AIRandomManager.m
//  Diceware
//
//  Created by Asim Ihsan on 08/01/2012.
//  Copyright (c) 2012 All rights reserved.
//  ----------------------------------------------------------------------------

#import "AIRandomManager.h"

// Private methods.
@interface AIRandomManager ()
- (void)initialize;
@end

@implementation AIRandomManager

#pragma mark External API

#pragma mark Singleton instance and methods

static AIRandomManager *sharedInstance = nil;

+ (AIRandomManager *)getInstance
{
    if (sharedInstance == nil)
    {
        sharedInstance = [[super allocWithZone:NULL] init];
        [sharedInstance initialize];
    }
    return sharedInstance;
}

- (void)initialize
{
    LOG_V("entry.");
    
    // !!AI dive in head first.
    const unsigned int BLOCKSIZE = 16 * 8;
    byte pcbScratch[BLOCKSIZE];
    CryptoPP::AutoSeededRandomPool rng;
    
    uint8_t data[64];
    int err = SecRandomCopyBytes(kSecRandomDefault, 64, data);
    LOG_V(@"error from SecRandomCopyBytes call: %i", err);
    rng.IncorporateEntropy(data, 64);
    
    rng.GenerateBlock(pcbScratch, BLOCKSIZE);
    for (unsigned int i=0; i<BLOCKSIZE; i++)
    {
        LOG_V(@"%02x", pcbScratch[i]);
    }
    
    LOG_V("exit.");
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [[self getInstance] retain];
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id)retain
{
    return self;
}

- (NSUInteger)retainCount
{
    return NSUIntegerMax; // denotes an object that cannot be released.
}

- (oneway void)release
{
    // do nothing.
}

- (id)autorelease
{
    return self;
}

@end
