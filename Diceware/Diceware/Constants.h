//
//  Constants.h
//  database
//
//  Created by Asim Ihsan on 02/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#ifndef CONSTANTS_H
#define CONSTANTS_H

#import "Logging/DDLog.h"
extern int ddLogLevel;
#include "Logging/AILogging.h"

#define StringFromBOOL(b) ((b) ? @"TRUE" : @"FALSE")

// -----------------------------------------------------------------------------
//  Assert and check macros.
//
//  - Assert implies a condition which, when failed, means the continued
//  execution of the application no longer makes sense and will probably
//  result in irreversal damage. The only sane option is to halt immediately.
//
//  - Check implies an unusual or unexpected condition that need debugging
//  but can be recovered from.
// -----------------------------------------------------------------------------
#define ASSERT(expr) if (!(expr))                                              \
                     {                                                         \
                         LOG_E(@"Assertion failed at '%s' line '%d': '%s'", __FILE__, __LINE__, #expr); \
                         NSAssert((expr), @"Assertion failed!");               \
                     }

#define CHECK(expr) if (!(expr))                                               \
                     {                                                         \
                         LOG_E(@"Check failed at '%s' line '%d': '%s'", __FILE__, __LINE__, #expr); \
                     }

#define CHECK_AND_EXIT(expr) if (!(expr))                                      \
                             {                                                 \
                                 LOG_E(@"Check failed at '%s' line '%d': '%s'", __FILE__, __LINE__, #expr); \
                                 goto EXIT_LABEL;                              \
                             }                                                 \

// -----------------------------------------------------------------------------

#endif
