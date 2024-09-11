#import "NSString+ValidNumber.h"

@implementation NSString (ValidNumber)

+ (NSNumberFormatter *)numberFormatter {
    static NSNumberFormatter *formatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [[NSNumberFormatter alloc] init];
        formatter.numberStyle = NSNumberFormatterDecimalStyle;
    });
    return formatter;
}

- (BOOL)isValidNumber {
    if ([self length] > 100) {
        return NO;
    }
    NSNumberFormatter *formatter = [NSString numberFormatter];
    NSNumber *number = [formatter numberFromString:self];
    return number != nil;
}

@end
