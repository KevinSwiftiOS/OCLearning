//
//  MainViewController.m
//  QQGroup
//
//  Created by ckq on 2019/4/16.
//  Copyright © 2019 ckq. All rights reserved.
//

#import "MainViewController.h"
#import "GroupTableViewCell.h"
@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"QQ分组"];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setTableView:[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain]];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[GroupTableViewCell class] forCellReuseIdentifier:@"GroupCell"];
    //设置黑色分割线为没有
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:_tableView];
    
    // Do any additional setup after loading the view.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GroupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GroupCell"];
    return cell;
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
