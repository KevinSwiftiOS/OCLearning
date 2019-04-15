//
//  FoodCellTableViewCell.h
//  TableViewCustomCell
//
//  Created by ckq on 2019/4/15.
//  Copyright © 2019 ckq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FoodCellTableViewCell : UITableViewCell
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *noteLabel;
-(void)updateCellWithModel;
@end

NS_ASSUME_NONNULL_END
