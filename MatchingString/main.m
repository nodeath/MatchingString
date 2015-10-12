//
//  main.m
//  MatchingString
//
//  Created by Shawn Hung on 10/8/15.
//  Copyright © 2015 Paganini Plus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+Matching.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *text = @"bacbababaabcbab";
        NSString *pattern = @"ababaca";
        NSInteger repeatTime = 100000;
        
        NSLog(@"Buildin:");
        NSDate *start = [NSDate date];
        for(NSInteger i=0; i<repeatTime; i++){
            [text containsString:pattern];
        }
        NSLog(@"excute time:%f", [[NSDate date] timeIntervalSinceDate:start]);
        
        NSLog(@"KMP:");
        start = [NSDate date];
        for(NSInteger i=0; i<repeatTime; i++){
            [text kmp_containsString:pattern];
        }
        
        NSLog(@"excute time:%f", [[NSDate date] timeIntervalSinceDate:start]);
        
        NSLog(@"Regex:");
        start = [NSDate date];
        for(NSInteger i=0; i<repeatTime; i++){
            [text regex_containsString:pattern];
        }
        
        NSLog(@"excute time:%f", [[NSDate date] timeIntervalSinceDate:start]);
    }
    return 0;
}
