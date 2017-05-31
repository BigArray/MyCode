//
//  SqliteController.m
//  MyCode
//
//  Created by 中付支付 on 2017/5/31.
//  Copyright © 2017年 zzf. All rights reserved.
//

#import "SqliteController.h"
#import "Z_ModelSqliteKit.h"
#import "Person.h"

@interface SqliteController ()

@end

@implementation SqliteController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    Person *p = [[Person alloc] init];
    p.name = @"zzz";
    p.age = 111;
    p.sex = @"m";
    p.address = @"China";
    p.hegiht = 180;
    
    //插入表
    [ZSqlite insert:p];
    //多线程插入
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        p.name = @"www";
        [ZSqlite insert:p];
    });
    
    
    //查询
    NSArray *pArr = [ZSqlite query:[Person class]];
    NSLog(@"%@", pArr);
    
    //批量插入
    [ZSqlite inserts:pArr];
    
    //条件查询
    NSArray *pArr2 = [ZSqlite query:[Person class] where:@"name = 'zzz'"];
    NSLog(@"%@", pArr2);
    
    //修改
    p.age = 10;
    [ZSqlite update:p where:@"name = 'zzz' OR age > 20"];
    
    //更新指定字段
    [ZSqlite update:Person.self value:@"name = 'qqq'" where:@"name = 'zzz'"];
    
    //删除
    [ZSqlite delete:[Person class] where:@"name = 'www'"];
    
    //删除所有
//    [ZSqlite removeModel:[Person class]];
    
    ///获取数据库本地路径
    NSString * path = [ZSqlite localPathWithModel:[Person class]];
    NSLog(@"localPath = %@",path);

    
    //其余方法看代码 哈哈哈 参考 Github <https://github.com/netyouli/WHC_ModelSqliteKit>
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
