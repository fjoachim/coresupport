//
//  NSData+CoreSupport.h
//  CoreSupport
//
//  Created by Joachim Fornallaz on 28.09.10.
//  Copyright 2010 Joachim Fornallaz. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSData (CoreSupport)

- (NSString *)md5HexDigest;
- (NSString *)stringWithUTF8Encoding;

@end
