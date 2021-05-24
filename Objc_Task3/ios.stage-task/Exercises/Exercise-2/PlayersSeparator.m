#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    NSInteger count = [ratingArray count];
    
    if (count != 0 || count >= 3) {
           NSMutableArray<NSArray<NSNumber*>*> *output = [NSMutableArray new];
           for (int i = 0; i < count - 1; i++) {
               for (int j = i + 1; j < count - 1; j++) {
                   for (int k = j + 1; k <= count - 1; k++) {
                       int iInt = [ratingArray[i] intValue];
                       int jInt = [ratingArray[j] intValue];
                       int kInt = [ratingArray[k] intValue];
                       
                       if (((iInt > jInt) && (jInt > kInt)) || ((iInt < jInt) && (jInt < kInt))) {
                           NSMutableArray *uniqueArray = [NSMutableArray arrayWithObjects:ratingArray[i],ratingArray[j],ratingArray[k], nil];
                           [output addObject:uniqueArray];
                       }
                   }
               }
           }
           return [output count];
       }
       return 0;
}

@end
