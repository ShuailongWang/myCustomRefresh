//
//  ViewController.m
//  myCustomRefresh
//
//  Created by admin on 17/1/12.
//  Copyright © 2017年 北京奥泰瑞格科技有限公司. All rights reserved.
//

#import "ViewController.h"
#import "CustomRefreshGifHeader.h"

@interface ViewController ()<UITableViewDelegate , UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;

@end

static NSString *UITableViewCellID = @"UITableViewCellID";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupUI];
}

-(void)setupUI{
    if (nil == _myTableView ) {
        _myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        [_myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:UITableViewCellID];
        CustomRefreshGifHeader *refresh_header = [CustomRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
        [refresh_header startNorAnimation];
        _myTableView.mj_header = refresh_header;
        [self.view addSubview:_myTableView];
    }
}

-(void)loadData{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.myTableView.mj_header endRefreshing];
    });
    
}

#pragma mark - UItableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UITableViewCellID forIndexPath:indexPath];
    
    return cell;
}

@end
