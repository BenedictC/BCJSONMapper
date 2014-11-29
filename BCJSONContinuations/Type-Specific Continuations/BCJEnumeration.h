//
//  BCJEnumeration.h
//  BCJSONMapper
//
//  Created by Benedict Cohen on 27/11/2014.
//  Copyright (c) 2014 Benedict Cohen. All rights reserved.
//

#import <BCLContinuations/BCLContinuations.h>
#import "BCJDefines.h"
#import "BCJSourceConstants.h"

@class BCJSource;
@class BCJTarget;



id<BCLContinuation> BCJ_OVERLOADABLE BCJEnumerateArray(BCJSource *source, Class elementClass, BOOL(^enumerator)(NSUInteger idx, id value, NSError **outError)) BCJ_REQUIRED(1,3);
id<BCLContinuation> BCJ_OVERLOADABLE BCJEnumerateDictionary(BCJSource *source, Class keyClass, Class elementClass, BOOL(^enumerator)(id key, id value, NSError **outError)) BCJ_REQUIRED(1,4);
