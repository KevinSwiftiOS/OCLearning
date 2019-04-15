//
//  FoodCellTableViewCell.m
//  TableViewCustomCell
//
//  Created by ckq on 2019/4/15.
//  Copyright © 2019 ckq. All rights reserved.
//

#import "FoodCellTableViewCell.h"

@implementation FoodCellTableViewCell
-(instancetype)init{
    self  = [super init];
    if(self){
        [self setTitleLabel:[[UILabel alloc]initWithFrame:CGRectMake(75, 10, 220, 10)]];
        [self.titleLabel setFont:[UIFont systemFontOfSize:10]];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)updateCellWithModel{
    
}
@end
