#import "NSArray+MinRotated.h"

@implementation NSArray (MinRotated)

- (NSNumber *)minRotated {
    if (self.count == 0) {
        return nil;
    }

    NSInteger first = 0;
    NSInteger last = self.count - 1;

    if ([self[first] intValue] < [self[last] intValue]) {
        return self[first];
    }

    while (first < last) {
        NSInteger middle = (first + last) / 2;

        if ([self[middle] intValue] > [self[last] intValue]) {
            first = middle + 1;
        } else {
            last = middle;
        }
    }

    return self[first];
}

@end
