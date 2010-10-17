//
//  NSString+CoreSupport.h
//  TwitterClient
//
//  Created by Joachim Fornallaz on 08.10.10.
//  Copyright 2010 Joachim Fornallaz. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (CoreSupport)

- (BOOL)isBlank;
- (NSString *)stringValueWithDefault:(NSString *)defaultValue;

@end
