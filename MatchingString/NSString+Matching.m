//
//  NSString+Matching.m
//  MatchingString
//
//  Created by Shawn Hung on 10/8/15.
//  Copyright © 2015 Paganini Plus. All rights reserved.
//

#import "NSString+Matching.h"

@implementation NSString (Matching)

- (BOOL) kmp_containsString:(NSString *)string{
    NSInteger length = [self length];
    NSInteger otherLength = [string length];
    NSArray *(^computePrefixFunction)(NSString *string) = ^NSArray *(NSString *string){
        NSInteger len = [string length];
        NSMutableArray *result = [NSMutableArray arrayWithCapacity:len];
        result[0] = @(0);
        NSInteger k = 0;
        for(NSInteger q = 1 ; q < len ; q++){
            while (k>0 && [string characterAtIndex:k] !=
                   [string characterAtIndex:q]) {
                k = [result[k] integerValue];
            }
            
            if ([string characterAtIndex:k] ==
                [string characterAtIndex:q]){
                k++;
            }
            
            result[q] = @(k);
        }
        
        return result;
    };
    
    NSArray *prefixFunction = computePrefixFunction(string);
    NSInteger q = 0;
    for(NSInteger i = 0; i<length ; i++){
        while (q > 0 && [string characterAtIndex:q] != [self characterAtIndex:i]) {
            q = [prefixFunction[q] integerValue];
        }
        
        if([string characterAtIndex:q] == [self characterAtIndex:i]){
            q++;
        }
        
        if(q == (otherLength - 1)){
            NSLog(@"Pattern occurs with shift %ld", (long)i - otherLength + 1);
            q = [prefixFunction[q] integerValue];
            return YES;
        }
    }
    
    return NO;
}

- (BOOL) regex_containsString:(NSString *)string{
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:string options:0 error:NULL];
    return [[regex matchesInString:self options:0 range:NSMakeRange(0, [self length])] count] > 0;
}

@end
