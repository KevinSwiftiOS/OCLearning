//
//  MainViewController.m
//  TableViewReuse
//
//  Created by ckq on 2019/4/15.
//  Copyright © 2019 ckq. All rights reserved.
//

#import "MainViewController.h"
#import "ImageTableViewCell.h"
@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitle:@"单元格重用"];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setTableView:[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain]];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[ImageTableViewCell class] forCellReuseIdentifier:@"imageCell"];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return CGRectGetWidth([UIScreen mainScreen].bounds);
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  18;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //可重用队列的使用
    ImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"imageCell"];
    if(!cell){
        cell = [[ImageTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"imageCell"];
    }
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
