//
//  NSString+CoreSupport.m
//  CoreSupport
//
//  Created by Joachim Fornallaz on 08.10.10.
//  Copyright 2010 Joachim Fornallaz. All rights reserved.
//

#import "NSString+CoreSupport.h"
#import "NSData+CoreSupport.h"


@implementation NSString (CoreSupport)

+ (NSString *)stringWithUUID
{
	CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
	NSString *uuidString = (NSString*)CFUUIDCreateString(kCFAllocatorDefault, uuidRef);
	CFRelease(uuidRef);
	return [uuidString autorelease];
}

- (BOOL)isBlank
{
	return ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0);
}

- (NSString *)stringValueWithDefault:(NSString *)defaultValue
{
	return [self isBlank] ? defaultValue : self;
}

- (NSString *)md5HexDigest
{
	return [[self dataUsingEncoding:NSUTF8StringEncoding] md5HexDigest];
}

@end
