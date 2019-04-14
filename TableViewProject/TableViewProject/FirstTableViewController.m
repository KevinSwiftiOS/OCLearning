//
//  FirstTableViewController.m
//  TableViewProject
//
//  Created by ckq on 2019/4/14.
//  Copyright © 2019 ckq. All rights reserved.
//

#import "FirstTableViewController.h"
@interface FirstTableViewController()<UITableViewDataSource>
@end
@interface FirstTableViewController ()

@end

@implementation FirstTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置背景颜色
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:tableView];
    //设置数据源
    tableView.dataSource = self;
    // Do any additional setup after loading the view.
}
//头部视图和尾部视图的设置
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Header";
}
//组的个数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//返回row
    return 5;
}
//返回cell的设置
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    cell.textLabel.text = @"Text";
    //添加自定义视图
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 150, 40)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    [cell addSubview:textField];
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
