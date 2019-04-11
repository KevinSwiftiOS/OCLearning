//
//  Person.h
//  archiver
//
//  Created by ckq on 2019/4/11.
//  Copyright © 2019 ckq. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject <NSCoding>
@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)NSUInteger age;
@property(nonatomic,copy)NSString *sex;
@end

NS_ASSUME_NONNULL_END
