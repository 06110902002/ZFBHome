//
//  HeadView.h
//  ZFBHome
//
//  Created by 刘小兵 on 2018/6/12.
//  Copyright © 2018 liuxx. All rights reserved.
//  头部视图 主要包括 可变化导航视图的与 网格菜单视图

#import <UIKit/UIKit.h>

@interface HeadView : UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong) UIView* headTopView;
@property(nonatomic,strong) UICollectionView* menuView;


-(void) changAlpha:(CGFloat) alpha;

@end
