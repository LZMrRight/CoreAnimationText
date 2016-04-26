
//
//  Test1ViewController.m
//  CoreAnimationText
//
//  Created by Mr.Right on 16/4/26.
//  Copyright © 2016年 lizheng. All rights reserved.
//

#import "Test1ViewController.h"

@interface Test1ViewController ()
@property(nonatomic,strong) UIView *layerView;
@end

@implementation Test1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"test1";
//    [self test1];
    
    
}


/**
 *  layer设置contents
 */
- (void)test1 {
    UIView *layerView = [[UIView alloc]init];
    layerView.backgroundColor = [UIColor grayColor];
    
    layerView.size = CGSizeMake(kScreenWidth - 80, kScreenHeight/2 - 40);
    
    layerView.center = CGPointMake(kScreenWidth/2, kScreenHeight/2);
    
    _layerView = layerView;
    
    [self.view addSubview:_layerView];
    UIImage *image = [UIImage imageNamed:@"img27"];
    self.layerView.layer.contents = (__bridge id)image.CGImage;
    self.layerView.layer.contentsGravity = kCAGravityCenter;
    self.layerView.layer.contentsScale = [UIScreen mainScreen].scale;
    self.layerView.layer.masksToBounds = YES;
}

/**
 *  layer设置contentsRect 实现拆图
 *  典型地，图片拼合后可以打包整合到一张大图上一次性载入。相比多次载入不同的图片，这样做能够带来很
 *  方面的好处：内存使用，载入时间，渲染性能等等
 */
- (void)addSpriteImage:(UIImage *)image withContentRect:(CGRect)rect toLayer:(CALayer *)layer {
    layer.contents = (__bridge id)image.CGImage;
    layer.contentsGravity = kCAGravityResizeAspect;
    layer.contentsRect = rect;
//    layer.contentsCenter
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
