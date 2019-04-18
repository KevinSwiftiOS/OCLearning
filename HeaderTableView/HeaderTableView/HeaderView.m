//
//  HeaderView.m
//  HeaderTableView
//
//  Created by ckq on 2019/4/18.
//  Copyright © 2019 ckq. All rights reserved.
//

#import "HeaderView.h"
@interface HeaderView ()
@property(nonatomic,strong)NSTimer *timer;
@end
@implementation HeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(instancetype)headerView{
    HeaderView *headerView = [[self alloc]init];
    [headerView setScrollView:[[UIScrollView alloc]init]];
    [headerView.scrollView setPagingEnabled:true];
    [headerView.scrollView setShowsHorizontalScrollIndicator:true];
    [headerView.scrollView setDelegate:headerView];
    [headerView addSubview:headerView.scrollView];
    return headerView;
}
-(void)willMoveToSuperview:(UIView *)newSuperview{
    CGFloat width = CGRectGetWidth(newSuperview.bounds);
    CGFloat height = 100;
    [self setFrame:CGRectMake(0, 0, width, height)];
    [self.scrollView setFrame:self.bounds];
    [self.scrollView setContentSize:CGSizeMake(3 * width, height)];
    [self addImageView];
    [self initTimer];
}

-(void)addImageView{
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);
    for(NSInteger i = 0; i < 3;i++){
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i * width, 0, width, height)];
        [self.scrollView addSubview:imageView];


}
}


-(void)initTimer{
    [self setTimer:[NSTimer timerWithTimeInterval:2 target:self selector:@selector(changeTimer) userInfo:nil repeats:true]];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];

}
-(void)changeTimer{
   
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if(self.timer){
        [self.timer invalidate];
        [self setTimer:nil];
}
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self initTimer];
}
@end
