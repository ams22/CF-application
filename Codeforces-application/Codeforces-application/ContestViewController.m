//
//  ContestViewController.m
//  codeforces
//
//  Created by Alex on 13.04.16.
//  Copyright © 2016 alex. All rights reserved.
//

#import "ContestViewController.h"
@import UIKit;
@implementation ContestViewController

+ (instancetype)loadFromNib {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *nibName = @"ContestView";
    NSArray *nibObjects = [bundle loadNibNamed:nibName owner:nil options:nil];
    return [nibObjects firstObject];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contestInfo.backgroundColor = [UIColor colorWithRed:0.5 green:0.0 blue:0.1 alpha:0.5];
    self.contestInfo.text = @"Lool";
//    self.imag.image = [UIImage imageNamed:@"icon"];
//    self.imageView.layer.cornerRadius = 21.f;
}

@end
