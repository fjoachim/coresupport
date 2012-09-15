//
//  NSDateAdditions.m
//  CoreSupport
//
//  Created by Joachim Fornallaz on 29.07.10.
//  Copyright 2010 Joachim Fornallaz. All rights reserved.
//

#import "NSDate+CoreSupport.h"


@implementation NSDate (CoreSupport)

+ (NSDate *)dateWithHTTPDateString:(NSString *)string
{
	static NSDateFormatter* formatter = nil;
	if (formatter == nil) {
		formatter = [[NSDateFormatter alloc] init];
		formatter.locale = [[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] autorelease]; 
		formatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
		formatter.dateFormat = @"EEE',' dd MMM yyyy HH':'mm':'ss ZZZ"; // "Wed, 20 Apr 2011 14:20:57 +0000"
	}
	return [formatter dateFromString:string];
}

- (NSDate *)atMidnight
{
	unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *components = [calendar components:unitFlags fromDate:self];
	return [calendar dateFromComponents:components];
}

- (NSDate *)endOfWeek
{
	unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit | NSWeekdayCalendarUnit;
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *components = [calendar components:unitFlags fromDate:self];
	NSInteger weekday = [components weekday];
	NSInteger firstWeekday = [calendar firstWeekday];
	NSInteger daysToEndOfWeek = (weekday < firstWeekday) ? (firstWeekday - weekday - 1) : (firstWeekday + 6 - weekday);
	
	NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
	[componentsToAdd setDay:daysToEndOfWeek];
	NSDate *endOfWeek = [calendar dateByAddingComponents:componentsToAdd toDate:[self atMidnight] options:0];
	[componentsToAdd release];
	return endOfWeek;
}

- (NSInteger)daysSince:(NSDate *)date
{
	NSTimeInterval delta = [[self atMidnight] timeIntervalSinceDate:[date atMidnight]];
	return (NSInteger)(delta / 86400);
}

- (NSInteger)weekdayForCurrentCalendar
{
	unsigned unitFlags = NSWeekdayCalendarUnit;
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *components = [calendar components:unitFlags fromDate:self];
	return [components weekday];
}

@end
