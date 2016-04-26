//
//  CAShapeLayer+viewmask.h
//  text
//
//  Created by Mr.Right on 16/3/21.
//  Copyright © 2016年 lizheng. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CAShapeLayer (viewmask)
+ (instancetype)createMaskLayerWithView:(UIView *)view;
@end
