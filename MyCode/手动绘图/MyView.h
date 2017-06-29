//
//  MyView.h
//  MyCode
//
//  Created by 中付支付 on 2017/6/29.
//  Copyright © 2017年 zzf. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface MyView : UIView
// get point  in view
- (void)initVariable;
-(void)addPA:(CGPoint)nPoint;
-(void)addLA;
-(void)revocation;
-(void)refrom;
-(void)clear;
-(void)setLineColor:(NSInteger)color;
-(void)setlineWidth:(NSInteger)width;
-(NSUInteger)doAnySign;
@end
