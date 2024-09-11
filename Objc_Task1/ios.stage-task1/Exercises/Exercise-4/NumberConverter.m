#import "NumberConverter.h"

@implementation NumberConverter

- (NSArray *)numberConverter:(NSNumber *)number {
    if (number == nil) {
        return [[NSArray alloc] init];
    }

    NSMutableArray *characters = [[NSMutableArray alloc] init];
    NSString *stringNumber = number.stringValue;
    [stringNumber enumerateSubstringsInRange:NSMakeRange(0, stringNumber.length)
                                     options:(NSStringEnumerationReverse | NSStringEnumerationByComposedCharacterSequences)
                                  usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        [characters addObject:substring];
    }];

    if (number.intValue <= 0) {
        [characters removeLastObject];
    }

    return characters;
}

@end
