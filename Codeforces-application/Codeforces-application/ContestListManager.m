//
//  ContestListManager.m
//  codeforces
//
//  Created by Сергей Миллер on 13.04.16.
//  Copyright © 2016 alex. All rights reserved.
//

#import "ContestListManager.h"
#import "AFNetworking.h"

@implementation ContestListManager
-(void)uploadCurrentContestListForContestListViewController:(ContestListViewController*)currentContestListViewController {
    //some magic whenever;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:@"http://codeforces.com/api/contest.list?gym=false"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        [currentContestListViewController processingResponceObject:responseObject withResponce:response withError:error];
    }];
    [dataTask resume];
}
@end
