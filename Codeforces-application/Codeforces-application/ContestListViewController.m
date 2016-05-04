//
//  ContestListViewController.m
//  codeforces
//
//  Created by Сергей Миллер on 13.04.16.
//  Copyright © 2016 alex. All rights reserved.
//
//#include <stdlib.h>
#import "ContestListViewController.h"
#import "ContestListManager.h"
#import "ContestViewCell.h"
#import "ContestInfo.h"
@interface ContestListViewController () <UITableViewDataSource , UITableViewDelegate>

@property (nonatomic , weak) IBOutlet
UITableView * tableView;

@property (nonatomic , strong)
NSArray * content;

@property (nonatomic , strong)
NSArray * responceList;

@property (nonatomic , strong)
NSMutableArray * pastContestList;

@property (nonatomic , strong)
NSMutableArray * futureContestList;

@property (nonatomic , strong)
ContestListManager * manager;

@property (weak, nonatomic)
UIRefreshControl *refreshControl;

@end

//@implementation Responce
//+(EKObjectMapping *)objectMapping
//{
//    return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
//        [mapping mapPropertiesFromArray:@[@"status", @"comment"]];
//        [mapping hasMany:[Contest class] forKeyPath:@"result"];
//    }];
//}
//@end

@implementation Contest
+(EKObjectMapping *)objectMapping
{
    return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
        [mapping mapPropertiesFromArray:@[@"name", @"phases", @"durationSeconds", @"startTimeSeconds"]];
    }];
}
@end


@implementation ContestListViewController

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    NSInteger idx = indexPath.row;
    
    ContestViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ContestViewCell" forIndexPath:indexPath];
     ContestInfo * contest;
    
    if(section == 0) {
         contest = _futureContestList[idx];
    } else {
        contest = _pastContestList[idx];
    }

    cell.contestInfo.text = [NSString stringWithFormat:@"%@ %@",contest.contestDate, contest.contestName , nil];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0) {
        return self.futureContestList.count;
    } else {
        return self.pastContestList.count;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section {
    if(section == 0) {
        return @"Current or upcoming contests";
    } else {
        return @"Contests history";
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.manager = [[ContestListManager alloc] init];
    
    
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    UINib *cellNib = [UINib nibWithNibName:@"ContestView" bundle: bundle];
    [_tableView registerNib:cellNib forCellReuseIdentifier:@"ContestViewCell"];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.estimatedRowHeight = 200.f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
    _refreshControl = refreshControl;
}

- (IBAction)refresh:(id)sender {
    [self.manager uploadCurrentContestListForContestListViewController: self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.refreshControl beginRefreshing];
    [self.manager uploadCurrentContestListForContestListViewController: self];
    NSLog(@"viewDidAppear");
}

-(void)processingResponceObject:(id)responseObject withResponce:(NSURLResponse*) URLresponse withError:(NSError*) error {
//    self.content = @[response];

//    NSLog(@"processing responce...");
    if (error) {
        NSLog(@"Error: %@", error);
        _responceList = @[];
        return;
    }
//
    NSLog(@"status: %@",responseObject[@"status"]);
    NSLog(@"result : %@",responseObject[@"result"][0]);
       if([responseObject[@"status"] isEqualToString:@"FAILED"]) {
        if(responseObject[@"comment"] != NULL) {
            NSLog(@"%@",responseObject[@"comment"]);
        } else {
            NSLog(@"Unknown Connection Error\n");
        }
        _responceList = @[];
    } else {
        _responceList = responseObject[@"result"];
    }
    
    _futureContestList = [[NSMutableArray alloc]init];
    _pastContestList = [[NSMutableArray alloc]init];
    
    long currentTime = [[NSDate date] timeIntervalSince1970];
    for(int i = 0; i < _responceList.count; ++i) {
        ContestInfo * contest = [ContestInfo initWithDictionary:_responceList[i]];
        long timeDiff = currentTime - contest.contestTimeSince1970;
        
        if(timeDiff > 0) {
            [_pastContestList addObject:contest];
        } else {
            [_futureContestList addObject:contest];
        }
    }
    
    [self.refreshControl endRefreshing];
    [self.tableView reloadData];
}

@end
