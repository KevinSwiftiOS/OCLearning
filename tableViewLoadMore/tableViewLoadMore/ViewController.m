//
//  ViewController.m
//  tableViewLoadMore
//
//  Created by ckq on 2019/4/17.
//  Copyright © 2019 ckq. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *modelArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"上拉加载更多"];
    [self setAutomaticallyAdjustsScrollViewInsets:false];
    [self setTableView:[[UITableView alloc]initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)) style:UITableViewStylePlain]];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];

    // Do any additional setup after loading the view, typically from a nib.
}
-(NSArray *)modelArray{
    if(!_modelArray){
        NSString *path = [[NSBundle mainBundle]pathForResource:@"qunar.plist" ofType:nil];
        NSArray *dataArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *tempArray = [NSMutableArray array];
        for(NSDictionary *dict in dataArray){
            tempArray addObject:[];
        }
        _modelArray = [tempArray copy];
    }
    return _modelArray;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 64;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

@end
