//
//  NSString+CoreSupport.h
//  CoreSupport
//
//  Created by Joachim Fornallaz on 08.10.10.
//  Copyright 2010 Joachim Fornallaz. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (CoreSupport)

/*!
 @method     isBlank
 @abstract   Returns YES if the receiver only consists of whitespaces and newlines.
 */
- (BOOL)isBlank;

/*!
 @method     stringValueWithDefault
 @abstract   Returns a the receicer itself if it is not blank, otherwise a default string.
*/
- (NSString *)stringValueWithDefault:(NSString *)defaultValue;

@end
