//
//  ContestViewController.h
//  codeforces
//
//  Created by Alex on 13.04.16.
//  Copyright © 2016 alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContestViewController : UIView

+ (instancetype) loadFromNib;

@property (nonatomic , weak) IBOutlet
UILabel * contestInfo;

@end