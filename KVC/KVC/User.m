//
//  User.m
//  KVC
//
//  Created by ckq on 2019/4/10.
//  Copyright © 2019 ckq. All rights reserved.
//

#import "User.h"
@interface User ()
@property(nonatomic,copy)NSString *sex;
@end
@implementation User
-(NSString *)description{
    return [NSString stringWithFormat:@"username = %@,sex = %@",_username,_sex];
}
@end
