//
//  main.m
//  KVC
//
//  Created by ckq on 2019/4/10.
//  Copyright © 2019 ckq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        User *user = [[User alloc]init];
        //通过kvc赋值
          [user setValue:@"default" forKey:@"username"];
           [user setValue:@"default" forKey:@"company"];
           [user setValue:@22 forKey:@"age"];
        [user setValue:@"male" forKey:@"sex"];
        NSLog(@"%@",user);
    }
    return 0;
}
