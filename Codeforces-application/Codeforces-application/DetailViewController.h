//
//  DetailViewController.h
//  Codeforces-application
//
//  Created by Сергей Миллер on 22.03.16.
//  Copyright © 2016 ioscourse. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

