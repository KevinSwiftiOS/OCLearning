//
//  TableViewDatasource.m
//  TableViewProject
//
//  Created by ckq on 2019/4/14.
//  Copyright © 2019 ckq. All rights reserved.
//

#import "TableViewDatasource.h"

@implementation TableViewDatasource
+(instancetype)dataSource{
    TableViewDatasource *dataSource = [[self alloc]init];
    return dataSource;
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
@end
