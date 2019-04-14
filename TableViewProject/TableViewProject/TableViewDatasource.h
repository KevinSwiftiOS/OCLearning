//
//  TableViewDatasource.h
//  TableViewProject
//
//  Created by ckq on 2019/4/14.
//  Copyright © 2019 ckq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewDatasource : NSObject<UITableViewDataSource>
+(instancetype)dataSource;
@end

NS_ASSUME_NONNULL_END
