//
//  LLCMainCellDataModel+LLCRequest.h
//  LLC_XIACHUFANG
//
//  Created by chendi on 16/10/9.
//  Copyright © 2016年 bbigcd. All rights reserved.
//

#import "LLCMainCellDataModel.h"
#import "Config.h"

@interface LLCMainCellDataModel (LLCRequest)

+ (void)fetchTableViewCellDataWithCompletionBlock:(CompletionBlock)successBlock withFailureBlock:(FailureBlock)failureBlock;

@end
