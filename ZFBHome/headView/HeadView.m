//
//  HeadView.m
//  ZFBHome
//
//  Created by 刘小兵 on 2018/6/12.
//  Copyright © 2018 liuxx. All rights reserved.
//

#import "HeadView.h"
#import "UIButton+ImgLabel.h"

#define SCREEN_HEIGHT                      [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH                       [UIScreen mainScreen].bounds.size.width

@implementation HeadView


-(instancetype) initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self initView];
    }
    return self;
}

-(void) initView{
    NSLog(@"26-----------");
    //构建头部视图容器
    self.headTopView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 95)];
    self.headTopView.backgroundColor = [UIColor cyanColor];
    [self addSubview:self.headTopView];
    
    UIButton* scanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    scanBtn.frame = CGRectMake(10, 7.5, 100, 80);
    scanBtn.backgroundColor = [UIColor redColor];
    [scanBtn setImage:[UIImage imageNamed:@"home_scan@2x"] forState:UIControlStateNormal];
    [scanBtn setTitle:@"scan" forState:UIControlStateNormal];
    [scanBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [scanBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleBottom imageTitleSpace:10];
    [self.headTopView addSubview:scanBtn];
    
    
    
    
    //1.初始化layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self.menuView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 95, SCREEN_WIDTH, 240) collectionViewLayout:layout];
    self.menuView.dataSource = self;
    self.menuView.delegate = self;
    self.menuView.backgroundColor = [UIColor whiteColor];
    [self.menuView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
    [self addSubview:self.menuView];
    
}

-(void) changAlpha:(CGFloat)alpha{
    
    self.headTopView.alpha = alpha;
}



//实现协议方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    

    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 12;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor cyanColor];
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat width = (SCREEN_WIDTH - 100) / 4;
    return CGSizeMake(width, 50);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return 20;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    
    return UIEdgeInsetsMake(10, 15, 10, 15);
    
}





@end
