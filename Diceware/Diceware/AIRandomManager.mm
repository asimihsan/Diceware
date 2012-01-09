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
- (int)getRandomInteger:(int)minimum :(int)maximum;
- (NSArray *)getRandomIntegers:(int)minimum :(int)maximum :(int)count;
@end

@implementation AIRandomManager

#pragma mark External API

#pragma mark Internal methods

// -----------------------------------------------------------------------------
//  Get a random integer. Minimum is an integer, maximum is an integer. Returns
//  a random integer with distribution U[minimum, maximum] (uniform, minimum
//  and maximum are inclusive).
//
//  We put everything in terms of int rather than NSInteger because we only
//  want to support 32 bit integers.
// -----------------------------------------------------------------------------
- (int)getRandomInteger:(int)minimum :(int)maximum
{
    //LOG_V(@"entry. minimum: %d, maximum: %d", minimum, maximum);
    
    // -------------------------------------------------------------------------
    //  Validate inputs.
    // -------------------------------------------------------------------------
    ASSERT(minimum >= 0);
    ASSERT(maximum >= 0);
    ASSERT(minimum <= maximum);
    // -------------------------------------------------------------------------
    
    int return_value = rng.GenerateWord32(minimum, maximum);
    //LOG_V(@"returning: %d", return_value);
    
    // -------------------------------------------------------------------------
    //  Validate outputs.
    // -------------------------------------------------------------------------
    ASSERT(return_value >= minimum);
    ASSERT(return_value <= maximum);
    // -------------------------------------------------------------------------    
    
    return return_value;
}

// -----------------------------------------------------------------------------
//  Get an array of random integers between minimum and maximum. The array
//  will have count elements inside it.
// -----------------------------------------------------------------------------
- (NSArray *)getRandomIntegers:(NSInteger)minimum :(NSInteger)maximum :(NSInteger)count
{
    LOG_V(@"entry. minimum: %d, maximum: %d, count: %d", minimum, maximum, count);
    
    // -------------------------------------------------------------------------
    //  Validate inputs.
    // -------------------------------------------------------------------------
    ASSERT(minimum >= 0);
    ASSERT(maximum >= 0);
    ASSERT(minimum <= maximum);
    ASSERT(count >= 0);
    // -------------------------------------------------------------------------    
    
    NSMutableArray *return_values = [[NSMutableArray alloc] initWithCapacity:count];
    for(int i = 0; i < count; i++)
    {
        int random_value = [self getRandomInteger :minimum :maximum];
        NSNumber *random_value_as_obj = [[NSNumber alloc] initWithInt:random_value];
        [return_values addObject:[random_value_as_obj autorelease]];
    }
    
    LOG_V(@"returning: %@", return_values);
    
    // -------------------------------------------------------------------------
    //  Validate outputs.
    // -------------------------------------------------------------------------
    ASSERT([return_values count] == count);
    // -------------------------------------------------------------------------
    
    return [return_values autorelease];
}

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
    
    uint8_t data[64];
    int err = SecRandomCopyBytes(kSecRandomDefault, 64, data);
    LOG_V(@"return from SecRandomCopyBytes call: %i", err);
    if (err)
    {
        LOG_E(@"error from SecRandomCopyBytes non-zero!");
    }
    rng.IncorporateEntropy(data, 64);
    
    /*
    for (int i = 0; i < 10; i++)
    {
        LOG_V(@"random integer: %d", [self getRandomInteger:0 :6667]);        
    }
     */
    
    NSAutoreleasePool *pool;
    pool = [[NSAutoreleasePool alloc] init];
    NSArray *random_integers = [self getRandomIntegers:0 :6667 :10];
    LOG_V(@"random integers: %@", random_integers);
    [pool drain];
    
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
