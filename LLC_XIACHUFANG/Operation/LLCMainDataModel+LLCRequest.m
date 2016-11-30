//
//  LLCMainDataModel+LLCRequest.m
//  LLC_XIACHUFANG
//
//  Created by chendi on 16/10/9.
//  Copyright © 2016年 bbigcd. All rights reserved.
//

#import "LLCMainDataModel+LLCRequest.h"
#import "LLCBaseNetManager.h"

// 基础ulr
static NSString *const url = @"http://api.xiachufang.com/v2/init_page_v5.json";


@implementation LLCMainDataModel (LLCRequest)

+ (void)fetchTableViewHeaderDataWithCompletionBlock:(CompletionBlock)successBlock withFailureBlock:(FailureBlock)failureBlock{
    
    // 拼接以下字符串,由于是GET请求，需放入url中
    // _ts              :  1473090254.801338                     :
    // api_key          :  07397197043fafe11ce5c65c10febf84      :  api
    // api_sign         :  a622485cbb002f950c18c8393e9d84f1      :  api标志？区分版本？
    // location_code    :  156440300000000                       :  地理代码
    // nonce            :  50C8CAEA-0A38-4B89-B3C3-645580759EFE  :  标志
    // origin           :  iphone                                :  客户端手机系统类型
    // sk               :  xtMHPgLaSnWmBJulQ-zPOQ                :  不知道
    // timezone         :  Asia/Shanghai                         :  应用所在大洲区
    // version          :  5.8.2                                 :  应用当前版本号
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"_ts"] = @"1473090254.801338";
    params[@"api_key"] = @"07397197043fafe11ce5c65c10febf84";
    params[@"api_sign"] = @"a622485cbb002f950c18c8393e9d84f1";
    params[@"location_code"] = @"156440300000000";
    params[@"nonce"] = @"50C8CAEA-0A38-4B89-B3C3-645580759EFE";
    params[@"origin"] = @"iphone";
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
