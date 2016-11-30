//
//  LLCMainScrollView.h
//  LLC_XIACHUFANG
//
//  Created by chendi on 16/9/28.
//  Copyright © 2016年 bbigcd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLCMainScrollView : UIView

- (void)setupTitleLabel:(NSString *)titleLabel withNumberLabel:(NSString *)numberLabel;

- (void)setupLeftImage:(UIImage *)leftImage withRightImageUrl:(NSURL *)rightImageUrl;

@end
