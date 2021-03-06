//
//  NSURL+CoreSupport.m
//  CoreSupport
//
//  Created by Joachim Fornallaz on 28.09.10.
//  Copyright 2010 Joachim Fornallaz. All rights reserved.
//

#import "NSURL+CoreSupport.h"
#import "NSString+CoreSupport.h"


@implementation NSURL (CoreSupport)

- (NSString *)md5HexDigest
{
	return [[self absoluteString] md5HexDigest];
}

- (NSURL *)URLByAppendingQueryFromDictionary:(NSDictionary *)queryParams
{
	NSString *appendedQueryPart = [NSString queryStringFromDictionary:queryParams];
	
	NSString *queryJoin = @"";
	if ([self query] == nil) {
		queryJoin = @"?";
	} else if ([[self query] length] > 0 && [appendedQueryPart length] > 0) {
		queryJoin = @"&";
	}
	
	NSString *fullURLString = [NSString stringWithFormat:@"%@%@%@", [self absoluteString], queryJoin, appendedQueryPart];
	return [NSURL URLWithString:fullURLString];
}

@end
