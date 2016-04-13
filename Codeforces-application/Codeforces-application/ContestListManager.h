//
//  ContestListManager.h
//  codeforces
//
//  Created by Сергей Миллер on 13.04.16.
//  Copyright © 2016 alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContestListViewController.h"

@interface ContestListManager : NSObject
-(void)uploadCurrentContestListForContestListViewController:(ContestListViewController*)currentContestListViewController;
@end
