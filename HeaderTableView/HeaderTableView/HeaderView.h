//
//  HeaderView.h
//  HeaderTableView
//
//  Created by ckq on 2019/4/18.
//  Copyright © 2019 ckq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HeaderView : UIView<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;
+(instancetype)headerView;
@end

NS_ASSUME_NONNULL_END
