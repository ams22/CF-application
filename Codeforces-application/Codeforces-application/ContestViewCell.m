//
//  ContestViewController.m
//  codeforces
//
//  Created by Alex on 13.04.16.
//  Copyright © 2016 alex. All rights reserved.
//

#import "ContestViewCell.h"
@import UIKit;

@implementation ContestViewCell
+ (instancetype)loadFromNib {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *nibName = @"ContestView";
    NSArray *nibObjects = [bundle loadNibNamed:nibName owner:nil options:nil];
    return [nibObjects firstObject];
}

+ (instancetype) initWithString:(NSString *) info {
    ContestViewCell * newObj = [[ContestViewCell alloc] init];
    newObj.contestInfo.text = info;
    return newObj;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contestInfo.backgroundColor = [UIColor colorWithRed:0.0 green:0.05 blue:0.1 alpha:0.1];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
