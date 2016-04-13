//
//  ContestListViewController.m
//  codeforces
//
//  Created by Сергей Миллер on 13.04.16.
//  Copyright © 2016 alex. All rights reserved.
//

#import "ContestListViewController.h"
#import "ContestListManager.h"
#import "ContestViewController.h"

@interface ContestListViewController ()

@end

@implementation ContestListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    ContestListManager* manager = [[ContestListManager alloc] init];
    [manager uploadCurrentContestListForContestListViewController: self];
    
    ContestViewController * contestView = [ContestViewController loadFromNib];
    
    [self.tableView beginUpdates];
//    [self.tableView insertSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:animated];
    [self.tableView endUpdates];
//    [self.tableView insertSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:animated];
//    [self.tableView insertSubview:contestView atIndex:0];
//    [self.tableView insertSubview:contestView atIndex:1];
}

-(void)processingResponceObject:(id)responseObject withResponce:(NSURLResponse*) response withError:(NSError*) error {
     NSLog(@"processing responce...");
    if (error) {
        NSLog(@"Error: %@", error);
    } else {
        NSLog(@"%@ %@", response, responseObject);
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
