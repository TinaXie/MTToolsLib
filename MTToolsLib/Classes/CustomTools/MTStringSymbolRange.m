//
//  MTStringSymbolRange.m
//  ARThirdTools
//
//  Created by xiejc on 2019/4/1.
//

#import "MTStringSymbolRange.h"

@interface MTStringSymbolRange ()
{
    NSString *_beginSymbol;
    NSString *_endSymbol;
    NSMutableString *_mutableString;
    NSMutableArray<NSValue *> *_ranges;
}

@end

@implementation MTStringSymbolRange

- (instancetype)initWithBeginSymbol:(NSString *)beginSymbol
                          endSymbol:(NSString *)endSymbol
                       formatString:(NSString *)formatString{
    if(self = [super init]){
        _beginSymbol = beginSymbol;
        _endSymbol = endSymbol;
        _mutableString = [formatString mutableCopy];
    }
    
    return self;
}

- (NSString *)replacedString{
    return [_mutableString copy];
}

- (NSRange)rangeForNextPairedSymbol{
    if(!_beginSymbol || _beginSymbol.length == 0
       || !_endSymbol || _endSymbol.length == 0
       || !_mutableString || _mutableString.length == 0){
        return NSMakeRange(NSNotFound, 0);
    }
    
    NSUInteger beginIndex = NSNotFound;
    NSUInteger endIndex = NSNotFound;
    
    NSRange beginRange = [_mutableString rangeOfString:_beginSymbol];
    NSRange endRange = [_mutableString rangeOfString:_endSymbol];
    if(beginRange.location != NSNotFound
       && endRange.location != NSNotFound
       && endRange.location > beginRange.location){
        beginIndex = beginRange.location;
        [_mutableString replaceCharactersInRange:beginRange withString:@""];
        
        endRange.location = endRange.location - beginRange.length;
        endIndex = endRange.location;
        [_mutableString replaceCharactersInRange:endRange withString:@""];
    }
    
    return NSMakeRange(beginIndex, endIndex - beginIndex);
}

- (NSArray<NSValue *> *)allRangesForPairedSymbol{
    if(_ranges == nil){
        _ranges = [NSMutableArray array];
        
        NSRange range;
        while((range = [self rangeForNextPairedSymbol]).location != NSNotFound){
            [_ranges addObject:[NSValue valueWithRange:range]];
        }
    }
    
    return [_ranges copy];
}

@end

