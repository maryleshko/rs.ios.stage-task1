#import "LeaderBoardTracker.h"

@interface LeaderBoardTracker()

@property (nonatomic, strong) NSArray <NSNumber *> *playersPlaces;

@end

@implementation LeaderBoardTracker

- (NSArray <NSNumber *> *)trackLeaderBoard:(NSArray <NSNumber *> *)rankedArray
                               playerArray:(NSArray <NSNumber *> *)playerArray {
    if (playerArray.count == 0) {
        return @[];
    }
    if (rankedArray.count == 0) {
        NSMutableArray *results = [[NSMutableArray alloc] initWithCapacity:playerArray.count];
        [playerArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [results addObject:@1];
        }];
        return results;
    }
    
    NSMutableArray *uniqueRanks = [[NSMutableArray alloc] init];

    for (NSNumber *number in rankedArray) {
        if (![uniqueRanks containsObject:number]) {
            [uniqueRanks addObject:number];
        }
    }

    NSMutableArray *results = [[NSMutableArray alloc] init];
        for (NSNumber *score in playerArray) {
            NSInteger place = 1;
            for (NSNumber *rank in uniqueRanks) {
                if (score.intValue >= rank.intValue) {
                    break;
                }
                place++;
            }
            [results addObject:@(place)];
        }

        return results;
}

@end
