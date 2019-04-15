//
//  ImageTableViewCell.h
//  TableViewReuse
//
//  Created by ckq on 2019/4/15.
//  Copyright © 2019 ckq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageTableViewCell : UITableViewCell
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,assign)NSUInteger currentR;
-(void)updateCelRow:(NSInteger)row;
@end

NS_ASSUME_NONNULL_END
