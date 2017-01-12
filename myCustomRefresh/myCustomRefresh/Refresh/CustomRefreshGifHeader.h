//
//  CustomRefreshGifHeader.h
//  RGfzzd
//
//  Created by admin on 17/1/12.
//  Copyright © 2017年 北京奥泰瑞格科技有限公司. All rights reserved.
//

#import <MJRefresh/MJRefresh.h>

@interface CustomRefreshGifHeader : MJRefreshGifHeader

/** 设置state状态下的动画图片images 动画持续时间duration*/
- (void)setImages:(NSArray *)images duration:(NSTimeInterval)duration forState:(MJRefreshState)state;
- (void)setImages:(NSArray *)images forState:(MJRefreshState)state;

//默认图片
- (void)startNorAnimation;

@end
