//
//  NSDateAdditions.h
//  CoreSupport
//
//  Created by Joachim Fornallaz on 29.07.10.
//  Copyright 2010 Joachim Fornallaz. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDate (CoreSupport)

- (NSDate *)atMidnight;
- (NSDate *)endOfWeek;
- (NSInteger)daysSince:(NSDate *)date;
- (NSInteger)weekdayForCurrentCalendar;

@end
