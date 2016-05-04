//
//  ContestInfo.m
//  Codeforces
//
//  Created by Alex on 04.05.16.
//  Copyright © 2016 alex. All rights reserved.
//

#import "ContestInfo.h"

@implementation ContestInfo

+ (instancetype) initWithDictionary: (NSDictionary *) info {
    ContestInfo * newObj = [[ContestInfo alloc] init];
    newObj.contestName = info[@"name"];
    
    long time = [info[@"startTimeSeconds"] longValue];
    newObj.contestTimeSince1970 = time;
    newObj.contestDate = [NSDate dateWithTimeIntervalSince1970: time];
    
    newObj.contestInfo = @"";
    return newObj;
}
@end
