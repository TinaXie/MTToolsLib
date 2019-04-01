//
//  NSDate+MT.h
//  ARThirdTools
//
//  Created by xiejc on 2019/4/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (MT)

+ (NSDate *)mt_dateFromString:(NSString *)dateString format:(NSString *)format;

+ (uint64_t)mt_timeStampForMillisecond;

- (uint64_t)mt_timeStampForMillisecond;

- (NSString *)mt_formatString:(NSString *)dateFormat;

#pragma mark - 日期

- (NSDate *)mt_previousDate;

- (NSDate *)mt_nextDate;

- (NSDate *)mt_previousMonthDate;

- (NSDate *)mt_nextMonthDate;

- (NSInteger)mt_daysInMonth;

- (NSInteger)mt_firstWeekDayInMonth;

- (NSInteger)mt_year;

- (NSInteger)mt_month;

- (NSInteger)mt_day;


@end

NS_ASSUME_NONNULL_END
