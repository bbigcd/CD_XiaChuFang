//
//  LLCMainCellDataModel+LLCRequest.m
//  LLC_XIACHUFANG
//
//  Created by chendi on 16/10/9.
//  Copyright © 2016年 bbigcd. All rights reserved.
//

#import "LLCMainCellDataModel+LLCRequest.h"
#import "LLCBaseNetManager.h"

static NSString *const url = @"http://api.xiachufang.com/v2/issues/list.json";

@implementation LLCMainCellDataModel (LLCRequest)

+ (void)fetchTableViewCellDataWithCompletionBlock:(CompletionBlock)successBlock withFailureBlock:(FailureBlock)failureBlock{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"_ts"] = @"1473090255.173335";
    params[@"api_key"] = @"07397197043fafe11ce5c65c10febf84";
    params[@"api_sign"] = @"0d94e0c5bdf1f8aaf190f37f40f1af7b";
    params[@"cursor"] = @"";
    params[@"location_code"] = @"156440300000000";
    params[@"nonce"] = @"BDEFB717-254E-4236-8046-5C06F9D9C770";
    params[@"origin"] = @"iphone";
    params[@"size"] = @"2";
    params[@"sk"] = @"xtMHPgLaSnWmBJulQ-zPOQ";
    params[@"timezone"] = @"Asia/Shanghai";
    params[@"version"] = @"5.8.2";
    
    [LLCBaseNetManager GET:url parameters:params completionHandler:^(id responseObj, NSError *error) {
        if (!error) {
            successBlock(responseObj);
        }else{
            failureBlock(error);
        }
    }];
}

@end
