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

@end
