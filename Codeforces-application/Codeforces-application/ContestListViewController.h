//
//  ContestListViewController.h
//  codeforces
//
//  Created by Сергей Миллер on 13.04.16.
//  Copyright © 2016 alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContestListViewController : UIViewController

-(void)processingResponceObject:(id)responseObject withResponce:(NSURLResponse*) response withError:(NSError*) error;
@end
