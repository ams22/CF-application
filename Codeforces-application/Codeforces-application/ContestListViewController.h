//
//  ContestListViewController.h
//  codeforces
//
//  Created by Сергей Миллер on 13.04.16.
//  Copyright © 2016 alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EasyMapping.h>

@interface ContestListViewController : UIViewController

-(void)processingResponceObject:(id)responseObject withResponce:(NSURLResponse*) response withError:(NSError*) error;
@end

@interface Responce : NSObject <EKMappingProtocol>
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *comment;
@property (nonatomic, strong) NSArray *contestList;
@end

typedef enum {
    BEFORE,
    CODING,
    PENDING_SYSTEM_TEST,
    SYSTEM_TEST,
    FINISHED
} Phase;

@interface Contest : NSObject <EKMappingProtocol>
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) Phase phase;
@property (nonatomic, readwrite)NSInteger *durationSeconds;
@property (nonatomic, readwrite)NSInteger *startTimeSeconds;
@end






