//
//  NSString+CoreSupport.m
//  TwitterClient
//
//  Created by Joachim Fornallaz on 08.10.10.
//  Copyright 2010 Joachim Fornallaz. All rights reserved.
//

#import "NSString+CoreSupport.h"


@implementation NSString (CoreSupport)

- (BOOL)isBlank
{
	return ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0);
}

- (NSString *)stringValueWithDefault:(NSString *)defaultValue
{
	return [self isBlank] ? defaultValue : self;
}

@end
