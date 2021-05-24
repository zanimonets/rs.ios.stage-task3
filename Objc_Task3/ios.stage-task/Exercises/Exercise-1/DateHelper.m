#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    if (monthNumber == 0 || monthNumber > 12)
        return nil;
    
    NSArray* months = @[@"January", @"February", @"March",
                        @"April", @"May", @"June",
                        @"July", @"August", @"September",
                        @"October", @"November", @"December"];
    
    
    return [months objectAtIndex: (monthNumber-1)];
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    NSDate *dateAsString = [dateFormatter dateFromString:date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components: NSDayCalendarUnit | NSWeekdayCalendarUnit fromDate: dateAsString];
    
    return [dateComponents day];
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitWeekday fromDate:date];
    
    NSArray *days = @[@"Пн", @"Вт", @"Ср", @"Чт", @"Пт", @"Сб", @"Вс"];
    
    return ([dateComponents weekday]) ? days[[dateComponents weekday] - 2] : nil;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSInteger currentWeek = [calendar component:NSCalendarUnitWeekOfYear fromDate:date];
    NSInteger dateWeek = [calendar component:NSCalendarUnitWeekOfYear fromDate:[NSDate now]];
    
    return (dateWeek == currentWeek) ? YES : NO;
}

@end
