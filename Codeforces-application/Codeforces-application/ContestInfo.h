//
//  ContestInfo.h
//  Codeforces
//
//  Created by Alex on 04.05.16.
//  Copyright © 2016 alex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContestInfo : NSObject

+ (instancetype) initWithDictionary: (NSDictionary *) info;

@property (nonatomic)
NSTimeInterval contestTimeSince1970;

@property (nonatomic , strong)
NSDate * contestDate;

@property (nonatomic , strong)
NSString * contestName;

@property (nonatomic , strong)
NSString * contestInfo;


@end
