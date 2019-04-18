//
//  GroupTableViewCell.m
//  QQGroup
//
//  Created by ckq on 2019/4/16.
//  Copyright © 2019 ckq. All rights reserved.
//

#import "GroupTableViewCell.h"

@implementation GroupTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), 0.35)];
        [lineView setBackgroundColor:[UIColor blackColor]];
        [self.contentView addSubview:lineView];
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
