//
//  NSDate+MT.m
//  ARThirdTools
//
//  Created by xiejc on 2019/4/1.
//

#import "NSDate+MT.h"

@implementation NSDate (MT)

+ (uint64_t)mt_timeStampForMillisecond{
    return [[self date] mt_timeStampForMillisecond];
}

- (uint64_t)mt_timeStampForMillisecond{
    uint64_t timeStamp = (uint64_t)(self.timeIntervalSince1970 * 1000);
    return timeStamp;
}

- (NSString *)mt_formatString:(NSString *)dateFormat{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = dateFormat;
    return [dateFormatter stringFromDate:self];
}

+ (NSDate *)mt_dateFromString:(NSString *)dateString format:(NSString *)format{
    if(!dateString || dateString.length == 0){
        return nil;
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = format;
    return [dateFormatter dateFromString:dateString];
}

#pragma mark - 日期

- (NSDate *)mt_previousDate {
    NSDate *preDate = [[NSDate alloc]initWithTimeIntervalSinceReferenceDate:([self timeIntervalSinceReferenceDate] - 24 * 3600)];
    return preDate;
}

- (NSDate *)mt_nextDate {
    NSDate *nextDate = [[NSDate alloc]initWithTimeIntervalSinceReferenceDate:([self timeIntervalSinceReferenceDate] + 24 * 3600)];
    return nextDate;
}

- (NSDate *)mt_previousMonthDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self];
    components.day = 15;
    if (components.month == 1) {
        components.month = 12;
        components.year -= 1;
    } else {
        components.month -= 1;
    }
    
    NSDate *result = [calendar dateFromComponents:components];
    return result;
}


- (NSDate *)mt_nextMonthDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self];
    
    if (components.month == 12) {
        components.month = 1;
        components.year += 1;
    } else {
        components.month += 1;
    }
    
    NSDate *result = [calendar dateFromComponents:components];
    return result;
}

- (NSInteger)mt_daysInMonth {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self];
    return range.length;
}

- (NSInteger)mt_firstWeekDayInMonth {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self];
    
    components.day = 1;
    NSDate *firstDay = [calendar dateFromComponents:components];
    if (firstDay == nil) {
        return 1;
    }
    NSInteger num = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDay];
    NSInteger result = num - 1;
    return result;
}

- (NSInteger)mt_year {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear fromDate:self];
    NSInteger result = components.year;
    return result;
}

- (NSInteger)mt_month {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitMonth fromDate:self];
    NSInteger result = components.month;
    return result;
}

- (NSInteger)mt_day {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitDay fromDate:self];
    NSInteger result = components.day;
    return result;
}

@end
