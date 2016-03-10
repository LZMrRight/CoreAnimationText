//
//  ViewController.m
//  CoreAnimationText
//
//  Created by Mr.Right on 16/3/7.
//  Copyright © 2016年 lizheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong) UIView *redView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.redView = [[UIView alloc]initWithFrame:CGRectMake(40, 40, 100, 100)];
    self.redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.redView];
    /**
     *  <#Description#>
     *
     *  @param id <#id description#>
     *
     *  @return <#return value description#>
     */
    self.view.layer.contents = (id)[UIImage imageNamed:@"0"].CGImage;

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [UIView animateWithDuration:2.f animations:^{
//        [_redView.layer setValue:@(M_PI) forKeyPath:@"transform.rotation"];
        
        _redView.layer.transform = CATransform3DMakeRotation(M_PI, 0, 0, 1);
        

    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
