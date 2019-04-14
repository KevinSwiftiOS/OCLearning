//
//  ThirdViewController.m
//  TableViewProject
//
//  Created by ckq on 2019/4/14.
//  Copyright © 2019 ckq. All rights reserved.
//

#import "ThirdViewController.h"
#import "CustomTableView.h"
#import "TableViewDatasource.h"
@interface ThirdViewController ()<UITableViewDataSource>
@property(nonatomic,strong)TableViewDatasource *dataSource;
@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setDataSource:[TableViewDatasource dataSource]];
    CustomTableView *tableView = [CustomTableView tableViewWithDataSource:self];
    [self.view addSubview:tableView];
    // Do any additional setup after loading the view.
}
//dataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
