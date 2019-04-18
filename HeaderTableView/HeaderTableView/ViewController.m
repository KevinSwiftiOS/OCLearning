//
//  ViewController.m
//  HeaderTableView
//
//  Created by ckq on 2019/4/18.
//  Copyright © 2019 ckq. All rights reserved.
//

#import "ViewController.h"
#import "HeaderView.h"
@interface ViewController ()
@property(nonatomic,strong)HeaderView *headerView;
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableView:[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain]];
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    [self  setHeaderView:[HeaderView headerView]];
    //设置表头视图
    [self.tableView setTableHeaderView:self.headerView];
    // Do any additional setup after loading the view, typically from a nib.
}


@end
