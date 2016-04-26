//
//  ViewController.m
//  CoreAnimationText
//
//  Created by Mr.Right on 16/3/7.
//  Copyright © 2016年 lizheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong) CALayer *layer;
@end

@implementation ViewController

static BOOL isAni = YES;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CALayer *layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 20, 30);
    layer.position = CGPointMake(100, 100);
    layer.contents = (id)[UIImage imageNamed: @"babytchi"].CGImage;
    _layer = layer;
    [self.view.layer addSublayer:_layer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    UITouch *touch = [touches anyObject];
//    CGPoint location = [touch locationInView:self.view];
//    [self transitionAnimationInlocation:location];
    
    [self addkeyAnimation];
    
}

- (void)addkeyAnimation {
    CAKeyframeAnimation *keyAni = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    // 绘制路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, _layer.position.x, _layer.position.y);
    CGPathAddCurveToPoint(path, NULL, 10, 200, 190, 300, 100, 400);
    
    keyAni.path = path;
    CGPathRelease(path);
    keyAni.duration=3.0;
    keyAni.calculationMode = kCAAnimationPaced;
    [_layer addAnimation:keyAni forKey:@"KeyAni"];
}

- (void)transitionAnimationInlocation:(CGPoint)location{
    
    CABasicAnimation *basicA = [CABasicAnimation animationWithKeyPath:@"position"];
    if (isAni) {
        basicA.fromValue = [NSValue valueWithCGPoint:location];
        _layer.position = location;
//        _layer.speed = 0.5;
        isAni = NO;
    } else {
        isAni = YES;
    }
    basicA.toValue = [NSValue valueWithCGPoint:location];
    // 添加动画到图层，注意key相当于给动画进行命名，以后获得该动画时可以使用此名称获取
    [basicA setValue: basicA.toValue forKey:@"kBasicAni_Position"];
    basicA.beginTime = CACurrentMediaTime() + 1.f;
    
    basicA.duration = 2;
    basicA.delegate = self;
    
    [_layer addAnimation:basicA forKey:@"basicA"];
    
}

- (void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"animationDidStart");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSLog(@"animationDidStop");
    
    // 开始事物
    [CATransaction begin];
    // 禁用隐式动画
    [CATransaction setDisableActions:YES];
    
    CGPoint toValue = [[anim valueForKey:@"kBasicAni_Position"] CGPointValue];
    _layer.position = toValue;
    
    // 提交事物
    [CATransaction commit];
}
@end
