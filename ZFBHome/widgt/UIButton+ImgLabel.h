//
//  UIButton+ImgLabel.h
//  ZFBHome
//
//  Created by 刘小兵 on 2018/6/12.
//  Copyright © 2018 liuxx. All rights reserved.
//  分类实现按钮中 图片与 文本的布局排列

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, MKButtonEdgeInsetsStyle) {
    MKButtonEdgeInsetsStyleTop, // image在上，label在下
    MKButtonEdgeInsetsStyleLeft, // image在左，label在右
    MKButtonEdgeInsetsStyleBottom, // image在下，label在上
    MKButtonEdgeInsetsStyleRight // image在右，label在左
};



@interface UIButton (ImgLabel)




/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;



@end
