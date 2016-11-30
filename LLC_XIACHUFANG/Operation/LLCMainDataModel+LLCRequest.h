//
//  LLCMainDataModel+LLCRequest.h
//  LLC_XIACHUFANG
//
//  Created by chendi on 16/10/9.
//  Copyright © 2016年 bbigcd. All rights reserved.
//

#import "LLCMainDataModel.h"
#import "Config.h"

@interface LLCMainDataModel (LLCRequest)

+ (void)fetchTableViewHeaderDataWithCompletionBlock:(CompletionBlock)successBlock withFailureBlock:(FailureBlock)failureBlock;

@end
