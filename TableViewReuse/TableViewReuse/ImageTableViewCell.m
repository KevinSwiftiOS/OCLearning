//
//  ImageTableViewCell.m
//  TableViewReuse
//
//  Created by ckq on 2019/4/15.
//  Copyright © 2019 ckq. All rights reserved.
//

#import "ImageTableViewCell.h"

@implementation ImageTableViewCell
#if 0
-(instancetype)init{
    self = [super init];
    if(self){
        [self setTitleLabel:[[UILabel alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetWidth([UIScreen mainScreen].bounds))]];
    }
    return self;
}
#else
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle: style reuseIdentifier:reuseIdentifier];
    return self;
}
#endif
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)updateCelRow:(NSInteger)row{
    //setTitle
    
}
-(void)dealloc{
    NSLog(@"cell被销毁");
}

@end
