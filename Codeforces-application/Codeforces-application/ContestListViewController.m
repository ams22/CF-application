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
NSArray * responceList;

@property (nonatomic , strong)
ContestListManager * manager;

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
    NSDictionary * contest =  _responceList[idx];
    cell.contestInfo.text = contest[@"name"];
    NSLog(@"%@", contest[@"name"]);
    NSLog(@"get Obj");
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"count");

    return self.responceList.count;
//    if(section != 0) return 0;
//    if(_content == nil) {
//        return 0;
//    }
//    return [_content count];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.manager = [[ContestListManager alloc] init];
    
//    NSString * first = @"loaoaoaaoaoak\naksdkasjdl\nkdkasda\nadkasd\nlasda\nklasklda;alsd;als;\n\n\n\n\n\n\nlaskdl;aksdkas;dk\n\n\n\nlakla;sk";
//    _test_content = @[first , @"second" , @"third"];
    
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    UINib *cellNib = [UINib nibWithNibName:@"ContestView" bundle: bundle];
    [_tableView registerNib:cellNib forCellReuseIdentifier:@"ContestViewCell"];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
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

-(void)processingResponceObject:(id)responseObject withResponce:(NSURLResponse*) URLresponse withError:(NSError*) error {
//    self.content = @[response];
//    NSLog(@"get");
    
//    _responceList = @[@"1", @"2\n2", @"3\n3\n3"];

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
//        _responceList = [EKMapper arrayOfObjectsFromExternalRepresentation:responseObject[@"result"]
////                                                                    withMapping:[Contest objectMapping]];
        
//        NSMutableDictionary *testDictionary = [[NSMutableDictionary alloc] init];
//        [testDictionary setValue: forKey:
//        Contest *test = [EKMapper objectFromExternalRepresentation: testd
//                                                       withMapping:[Contest objectMapping]];
//        for(id key in responseObject[@"result"][0]) {
//            NSLog(@"%@ : %@", key, responseObject[@"result"][0][key]);
//        }
        _responceList = responseObject[@"result"];
//
    }
//
//    NSLog(@"%@",_responceList);

    
    [self.tableView reloadData];
//    
//     NSLog(@"processing responce...");
//    if (error) {
//        NSLog(@"Error: %@", error);
//    } else {
//        NSLog(responseObject);
//        //NSDictionary *res = responseObject;
//        NSDictionary *res2 = @{@"1":@"2",@"2":@"3"};
////        NSLog(res);
////        NSLog(res2);
//    }
//    
}

@end
