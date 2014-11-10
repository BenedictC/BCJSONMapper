//
//  BCJGettersAndSetters.m
//  BCJJSONContinuations
//
//  Created by Benedict Cohen on 01/11/2014.
//  Copyright (c) 2014 Benedict Cohen. All rights reserved.
//

#import "BCJGettersAndSetters.h"
#import "BCJJSONSource.h"
#import "BCJJSONTarget.h"



#pragma mark - Get arbitary object continuations
id<BCLContinuation> BCJ_OVERLOADABLE BCJGetValue(BCJJSONSource *source, BOOL(^successBlock)(id value, NSError **outError)) {
    NSCParameterAssert(source);
    NSCParameterAssert(successBlock);

    return BCLContinuationWithBlock(^BOOL(NSError *__autoreleasing *outError) {
        id value;
        if (![source getValue:&value error:outError]) return NO;

        return successBlock(value, outError);
    });
}



#pragma mark - Set arbitary object continuations
id<BCLContinuation> BCJ_OVERLOADABLE BCJSetValue(BCJJSONTarget *target, BCJJSONSource *source) {
    NSCParameterAssert(target);
    NSCParameterAssert(source);

    return BCLContinuationWithBlock(^BOOL(NSError *__autoreleasing *outError) {
        id value;
        if (![source getValue:&value error:outError]) return NO;

        return [target setWithValue:value outError:outError];
    });
}