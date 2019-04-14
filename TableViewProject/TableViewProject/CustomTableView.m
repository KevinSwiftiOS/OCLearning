//
//  CustomTableView.m
//  TableViewProject
//
//  Created by ckq on 2019/4/14.
//  Copyright © 2019 ckq. All rights reserved.
//

#import "CustomTableView.h"

@implementation CustomTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(instancetype)tableViewWithDataSource:(id<UITableViewDataSource>)dataSource{
//加载xib文件
    CustomTableView *tableView = [[[NSBundle mainBundle]loadNibNamed:@"CustomTableView" owner:self options:nil] lastObject];
    [tableView setDataSource:dataSource];
    return tableView;
    
}
@end
