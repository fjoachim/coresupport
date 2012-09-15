//
//  NSData+CoreSupport.m
//  CoreSupport
//
//  Created by Joachim Fornallaz on 28.09.10.
//  Copyright 2010 Joachim Fornallaz. All rights reserved.
//

#import "NSData+CoreSupport.h"
#import <CommonCrypto/CommonDigest.h>


@implementation NSData (CoreSupport)

- (NSString *)md5HexDigest
{
	unsigned char result[CC_MD5_DIGEST_LENGTH];
	CC_MD5([self bytes], (CC_LONG)[self length], result);
	
	NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
	for (int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
		[ret appendFormat:@"%02x", result[i]];
	}
	return ret;	
}

- (NSString *)stringWithUTF8Encoding
{
	NSString *string = [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
	return [string autorelease];
}

@end
