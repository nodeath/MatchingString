//
//  NSString+Matching.h
//  MatchingString
//
//  Created by Shawn Hung on 10/8/15.
//  Copyright © 2015 Paganini Plus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Matching)

- (BOOL) kmp_containsString:(NSString *)string;

- (BOOL) regex_containsString:(NSString *)string;

@end
