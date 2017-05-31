//
//  Person.h
//  MyCode
//
//  Created by 中付支付 on 2017/5/31.
//  Copyright © 2017年 zzf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Person : NSObject

@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong)NSString *sex;
@property (nonatomic, assign)NSInteger age;
@property (nonatomic, assign)CGFloat hegiht;
@property (nonatomic, strong)NSString *address;

@end
