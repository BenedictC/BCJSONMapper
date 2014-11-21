//
//  BCJJSONSourceTests.m
//  BCJJSONContinuations
//
//  Created by Benedict Cohen on 07/11/2014.
//  Copyright (c) 2014 Benedict Cohen. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BCJJSONSource+DeferredClassCheck.h"
#import <objc/runtime.h>



@interface BCJJSONSourceTests : XCTestCase

@end



@implementation BCJJSONSourceTests

-(void)testValidDesignatedInitalizer
{
    //Given
    NSMutableString *object = [NSMutableString stringWithString:@"arf"];
    NSString *JSONPath = @"self";
    Class defaultExpectedClass = NSString.class;
    BCJJSONSourceOptions options = BCJJSONSourceModeDefaultable;
    id defaultValue = @"default";

    //When
    BCJJSONSource *source = [[BCJJSONSource alloc] initWithObject:object JSONPath:JSONPath expectedClass:defaultExpectedClass options:options defaultValue:defaultValue];

    //Then
    XCTAssertEqualObjects(object, source.object, @"Constructor failed to set object.");
    XCTAssertEqualObjects(JSONPath, source.JSONPath, @"Constructor failed to set path.");
    XCTAssertEqualObjects(defaultExpectedClass, source.expectedClass, @"Constructor failed to set defaultExpectedClass.");
    XCTAssertEqual(options, source.options, @"Constructor failed to set options.");
    XCTAssertEqualObjects(defaultValue, source.defaultValue, @"Constructor failed to set defaultValue.");
}



//-(void)testInvalidDesignatedInitalizer
//{
//    //Given
//    NSMutableString *object = [NSMutableString stringWithString:@"arf"];
//    NSString *JSONPath = @"self";
//    Class defaultExpectedClass = NSString.class;
//    BCJJSONSourceOptions options = BCJJSONSourceModeDefaultable;
//    id defaultValue = @"default";
//
//    //When
//    //...
//
//    //Then
//    XCTFail(@"should raise exception when object is nil and when JSONPath is nil/invalid.");
//}
//
//
//
//-(void)testGetModeOptionalValidObject
//{
//    //Given (setup environment)
//    NSDictionary *object = @{@"number": @123456};
//    NSString *path = @"number";
//    Class expectedClass = nil;
//    BCJJSONSourceMode mode = BCJJSONSourceModeOptional;
//    id defaultValue = nil;
//    BCJJSONSource *source = BCJJSONSource(object, path, expectedClass, mode, defaultValue);
//
//    //When (perform the action)
//    id actualValue;
//    NSError *error;
//    BCJJSONSourceResult actualResult = [source getValue:&actualValue error:&error];
//
//    //Then (verify the action had the expected result)
//    BCJJSONSourceResult expectedResult = BCJJSONSourceResultSuccess;
//    XCTAssertEqual(actualResult, expectedResult, @"Incorrect result");
//
//    id expectedValue = @123456;
//    XCTAssertEqualObjects(expectedValue, actualValue, @"Incorrect value");
//}



-(void)testGetModeOptionalInvalidObject
{
    //Given (setup environment)
    NSDictionary *object = @{@"number": @123456};
    NSString *path = @"notAnumber";
    Class expectedClass = nil;
    BCJJSONSourceMode mode = BCJJSONSourceModeOptional;
    id defaultValue = nil;
    BCJJSONSource *source = BCJJSONSource(object, path, expectedClass, mode, defaultValue);

    //When (perform the action)
    id actualValue;
    NSError *error;
    BCJJSONSourceResult actualResult = [source getValue:&actualValue error:&error];

    //Then (verify the action had the expected result)
    BCJJSONSourceResult expectedResult = BCJJSONSourceResultValueNotFound;
    XCTAssertEqual(actualResult, expectedResult, @"Incorrect result");

    id expectedValue = nil;
    XCTAssertEqualObjects(expectedValue, actualValue, @"Incorrect value");
}


-(void)testGetModeNullOptional
{
    XCTFail(@"TODO");
}



-(void)testGetModeDefaultable
{
    XCTFail(@"TODO");
}



-(void)testGetModeNullDefaultable
{
    XCTFail(@"TODO");
}



-(void)testGetModeStrict
{
    XCTFail(@"TODO");
}



-(void)testGetModeNullStrict
{
    XCTFail(@"TODO");
}



-(void)testDeferredClassCheck
{
    XCTFail(@"TODO");    
    //TODO: Test which class gets used for type checking
}

@end
