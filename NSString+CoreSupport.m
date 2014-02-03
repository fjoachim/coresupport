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

+ (NSString *)queryStringFromDictionary:(NSDictionary *)dictionary
{
	NSMutableArray *assignments = [NSMutableArray arrayWithCapacity:[dictionary count]];
	for (NSString *key in dictionary) {
		NSString *value = [[dictionary objectForKey:key] description];
		if ([value isKindOfClass:[NSString class]]) {
			[assignments addObject:[NSString stringWithFormat:@"%@=%@", [key stringWithURLPercentEncoding], [value stringWithURLPercentEncoding]]];
		}
	}
	return [assignments componentsJoinedByString:@"&"];
}

- (NSDictionary *)queryDictionary
{
	NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
	NSArray *fragmentAssignments = [self componentsSeparatedByString:@"&"];
	for (NSString *assignment in fragmentAssignments) {
		NSArray *pair = [assignment componentsSeparatedByString:@"="];
		if ([pair count] == 2 && [[pair firstObject] length] && [[pair lastObject] length]) {
			NSString *value = [[pair lastObject] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
			[dictionary setObject:value forKey:[pair firstObject]];
		}
	}
	return dictionary;
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

- (NSString *)stringWithURLPercentEncoding
{
	CFStringRef reserved = (CFStringRef)@"!*'();:@&=+$,/?%#[]";
	NSString *escaped = (NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)self, NULL, reserved, kCFStringEncodingUTF8);
	return [escaped autorelease];
}

@end
