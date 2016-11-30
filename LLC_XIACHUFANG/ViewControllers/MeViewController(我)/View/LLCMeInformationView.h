//
//  LLCMeInformationView.h
//  LLC_XIACHUFANG
//
//  Created by bigcd on 16/9/12.
//  Copyright © 2016年 bbigcd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLCMeInformationView : UIView

/** 头像 */
@property (nonatomic, strong) UIImageView *headImageView;

/** 用户昵称 */
@property (nonatomic, strong) UILabel *userNickNameLabel;

/** 关注 */
@property (nonatomic, strong) UILabel *followLabel;
@end
