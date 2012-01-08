//
//  AILogging.h
//  database
//
//  Created by Asim Ihsan on 02/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#ifndef AI_LOGGING_H
#define AI_LOGGING_H

#define LOG_V(fmt, ...)    DDLogVerbose((@"%s " fmt), __PRETTY_FUNCTION__, ##__VA_ARGS__);
#define LOG_I(fmt, ...)       DDLogInfo((@"%s " fmt), __PRETTY_FUNCTION__, ##__VA_ARGS__);
#define LOG_W(fmt, ...)       DDLogWarn((@"%s " fmt), __PRETTY_FUNCTION__, ##__VA_ARGS__);
#define LOG_E(fmt, ...)      DDLogError((@"%s " fmt), __PRETTY_FUNCTION__, ##__VA_ARGS__);

#endif
