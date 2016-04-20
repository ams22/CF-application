//
//  ContestListViewController.m
//  codeforces
//
//  Created by Сергей Миллер on 13.04.16.
//  Copyright © 2016 alex. All rights reserved.
//

#import "ContestListViewController.h"
#import "ContestListManager.h"
#import "ContestViewCell.h"

@interface ContestListViewController () <UITableViewDataSource , UITableViewDelegate>

@property (nonatomic , weak) IBOutlet
UITableView * tableView;

@property (nonatomic , strong)
NSArray * content;

@property (nonatomic , strong)
NSArray * test_content;

@property (nonatomic , strong)
ContestListManager * manager;

@end

@implementation ContestListViewController

//-(CGFloat) tableView:(UITableView *) tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
//    NSInteger idx = indexPath.row;
//    
//    ContestViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ContestViewCell" forIndexPath:indexPath];
//    
//    return 0;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger idx = indexPath.row;
    ContestViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ContestViewCell" forIndexPath:indexPath];
    NSString * text = _test_content[idx];
    cell.contestInfo.text = text;

    NSLog(@"get Obj");
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"count");

    return self.test_content.count;
//    if(section != 0) return 0;
//    if(_content == nil) {
//        return 0;
//    }
//    return [_content count];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.manager = [[ContestListManager alloc] init];
    
    NSString * first = @"loaoaoaaoaoak\naksdkasjdl\nkdkasda\nadkasd\nlasda\nklasklda;alsd;als;\n\n\n\n\n\n\nlaskdl;aksdkas;dk\n\n\n\nlakla;sk";
    _test_content = @[first , @"second" , @"third"];
    
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    UINib *cellNib = [UINib nibWithNibName:@"ContestView" bundle: bundle];
    [_tableView registerNib:cellNib forCellReuseIdentifier:@"ContestViewCell"];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.estimatedRowHeight = 200.f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.manager uploadCurrentContestListForContestListViewController: self];
    NSLog(@"viewDidAppear");
}

-(void)processingResponceObject:(id)responseObject withResponce:(NSURLResponse*) response withError:(NSError*) error {
//    self.content = @[response];
//    NSLog(@"get");
    [self.tableView reloadData];
    
//     NSLog(@"processing responce...");
//    if (error) {
//        NSLog(@"Error: %@", error);
//    } else {
//        NSLog(@"%@ %@", response, responseObject);
//    }
}

@end
