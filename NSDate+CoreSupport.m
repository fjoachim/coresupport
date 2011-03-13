//
//  NSDateAdditions.m
//  CoreSupport
//
//  Created by Joachim Fornallaz on 29.07.10.
//  Copyright 2010 Joachim Fornallaz. All rights reserved.
//

#import "NSDate+CoreSupport.h"


@implementation NSDate (CoreSupport)

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
