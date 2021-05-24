#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSMutableString *minString = [NSMutableString new];

    while ([string1 length] || [string2 length]){
        NSRange range = NSMakeRange(0, 1);
        unichar currentCharString1 = [string1 length] ? [string1 characterAtIndex:0] : -1;
        unichar currentCharString2 = [string2 length] ? [string2 characterAtIndex:0] : -1;
        NSString *currentChar = (currentCharString1 < currentCharString2) ? [string1 substringWithRange:range] : [string2 substringWithRange:range];
         
         if ([string1 hasPrefix:currentChar])
         {
             string1 = [string1 substringFromIndex:1];
         } else
         {
             string2 = [string2 substringFromIndex:1];
         }
         
         [minString appendString:currentChar];
     }
     
     return minString;
}

@end
