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
 @method     stringWithUUID
 @abstract   Returns a string representing a UUID.
 */
+ (NSString *)stringWithUUID;

/*!
 @method     queryStringFromDictionary
 @abstract   Returns a query string constructed from a dictionary.
 */
+ (NSString *)queryStringFromDictionary:(NSDictionary *)dictionary;

/*!
 @method     queryDictionary
 @abstract   Returns a dictionary if the string is a valid URL query
 */
- (NSDictionary *)queryDictionary;

/*!
 @method     isBlank
 @abstract   Returns YES if the receiver only consists of whitespaces and newlines.
 */
- (BOOL)isBlank;

/*!
 @method     stringValueWithDefault
 @abstract   Returns the receiver itself if it is not blank, otherwise a default string.
*/
- (NSString *)stringValueWithDefault:(NSString *)defaultValue;

/*!
 @method     md5HexDigest
 @abstract   Returns the hexadecimal value of the MD5 digest of the string's UTF8 data.
 */
- (NSString *)md5HexDigest;

/*!
 @method     stringByEscapingForURLArgument
 @abstract   Returns a string suitable to be used in an URL.
 */
- (NSString *)stringWithURLPercentEncoding;

@end
