//
//  User.h
//  KVC
//
//  Created by ckq on 2019/4/10.
//  Copyright © 2019 ckq. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject
@property(nonatomic,copy)NSString *username;
@property(nonatomic,copy)NSString *company;
@property(nonatomic,strong)NSNumber *age;
@end

NS_ASSUME_NONNULL_END
