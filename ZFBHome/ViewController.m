//
//  ViewController.m
//  ZFBHome
//
//  Created by 刘小兵 on 2018/6/12.
//  Copyright © 2018 liuxx. All rights reserved.
//

#import "ViewController.h"
#import "HeadView.h"

#define SCREEN_HEIGHT                      [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH                       [UIScreen mainScreen].bounds.size.width

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property (nonatomic) UIView *coverNavView;
@property (nonatomic) UIView *mainNavView;
@property (nonatomic) HeadView *headerView;

@property (nonatomic) UITableView *tableView;

@property (nonatomic) HeadView * childView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildUI];
   
}

-(void) buildUI{
    
    
    self.coverNavView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 64)];
    self.coverNavView.alpha = 0;
    self.coverNavView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.coverNavView];
    UIButton *scan_mini = [UIButton buttonWithType:UIButtonTypeCustom];
    scan_mini.frame = CGRectMake(10,(64 - 35) / 2,35,35);
    [scan_mini setImage:[UIImage imageNamed:@"pay_mini@2x"] forState:UIControlStateNormal];
    [self.coverNavView addSubview:scan_mini];
    
    UIButton *pay_mini = [UIButton buttonWithType:UIButtonTypeCustom];
    pay_mini.frame = CGRectMake(60,(64 - 35) / 2,35,35);
    [pay_mini setImage:[UIImage imageNamed:@"pay_mini@2x"] forState:UIControlStateNormal];
    [self.coverNavView addSubview:pay_mini];
    
    UIButton *add = [UIButton buttonWithType:UIButtonTypeCustom];
    add.frame = CGRectMake(SCREEN_WIDTH - 60,(64 - 35) / 2,35,35);
    [add setImage:[UIImage imageNamed:@"pay_mini@2x"] forState:UIControlStateNormal];
    [self.coverNavView addSubview:add];
    
    
    self.mainNavView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 64)];
    self.mainNavView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.mainNavView];
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(10, 8, 322, 44)];
    searchBar.text = @"游戏";
    [self.mainNavView addSubview:searchBar];
    
    UIButton *contact = [UIButton buttonWithType:UIButtonTypeCustom];
    contact.frame = CGRectMake(SCREEN_WIDTH - 60,(64 - 35) / 2,35,35);
    [contact setImage:[UIImage imageNamed:@"home_contacts@2x"] forState:UIControlStateNormal];
    [self.mainNavView addSubview:contact];
    
    
    //构建导航与菜单栏
    self.childView = [[HeadView alloc] init];
    
    
    //构建滚动列表
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 84, SCREEN_WIDTH, SCREEN_HEIGHT - 84) style: UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.headerView = self.childView;
    self.headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 305);
    
    [self.tableView addSubview:self.headerView];
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 305)];
    self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(305, 0, 0, 0);

    
    [self.view addSubview:self.tableView];
    
   
}


- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 305);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 15;
}



static NSString* cellID = @"cellID";


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    UITableViewCell* tableViewCell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (tableViewCell == nil) {
        tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    tableViewCell.textLabel.text = @"test";
    return tableViewCell;
}


//实现滚动UIScrollViewDelegate 协议
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    CGFloat offsetY = scrollView.contentOffset.y;
    if(offsetY > 0 && offsetY < 24){
        [self.tableView setContentOffset:CGPointMake(0, 0) animated:true];
    }
    else if(offsetY >= 24 && offsetY < 95){
        [self.tableView setContentOffset:CGPointMake(0, 95) animated:true];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if(offsetY <= 0){
        self.headerView.frame = CGRectMake(0, offsetY, SCREEN_WIDTH, 305);
        [self.childView changAlpha:1];
        self.coverNavView.alpha = 0;
        self.mainNavView.alpha = 1;
    }
    else if(offsetY > 0 && offsetY < 95){
        CGFloat alpha = (1 - offsetY / 95) > 0 ? (1 - offsetY / 95) : 0;
        [self.childView changAlpha:alpha / 3];
        
        if(alpha > 0.9){
            self.coverNavView.alpha = 0;
            self.mainNavView.alpha = alpha / 5;
        }else{
            self.mainNavView.alpha = 0;
            self.coverNavView.alpha = 1 - alpha;
            if(alpha <= 0.75){
                [self.childView changAlpha:0];
            }
        }
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
