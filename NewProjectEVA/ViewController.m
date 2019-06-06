//
//  ViewController.m
//  NewProjectEVA
//
//  Created by admin on 05.06.2019.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *animateButton;
@property (nonatomic, strong) UIButton *animateBackgroundButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    #pragma mark - View заголовок
    
    self.headerView = [UIView new];
    self.headerView.backgroundColor = [UIColor blueColor];
    
    
    #pragma mark - ImageView картинка
    
    self.imageView = [UIImageView new];
    self.imageView.backgroundColor = [UIColor redColor];
    
    
    #pragma mark - View снизу
    
    self.bottomView = [UIView new];
    self.bottomView.backgroundColor = [UIColor colorWithRed:0.8 green:1 blue:0.8 alpha:1];
    
    
    #pragma mark - Кнопка на View снизу, анимация Масштаб и сдвиг по оси Х
    
    self.animateButton = [UIButton new];
    [self.animateButton setTitle:@"Animate Scale&Drag X" forState:UIControlStateNormal];
    [self.animateButton setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    [self.animateButton addTarget:self action:@selector(buttonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    self.animateButton.layer.borderWidth = 3.f;
    self.animateButton.layer.cornerRadius = 8.f;
    
    
    #pragma mark - Кнопка на View снизу, анимация Масштаб и сдвиг по оси Х
    
    self.animateBackgroundButton = [UIButton new];
    [self.animateBackgroundButton setTitle:@"Animate shadow" forState:UIControlStateNormal];
    [self.animateBackgroundButton setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    [self.animateBackgroundButton addTarget:self action:@selector(buttonShadowDidTap:) forControlEvents:UIControlEventTouchUpInside];
    self.animateBackgroundButton.layer.borderWidth = 3.f;
    self.animateBackgroundButton.layer.cornerRadius = 8.f;
    
    
    #pragma mark - Добавление Views на основное View
    
    [self.view addSubview:self.headerView];
    [self.headerView addSubview:self.imageView];
    [self.view addSubview:self.bottomView];
    [self.bottomView addSubview:self.animateButton];
    [self.bottomView addSubview:self.animateBackgroundButton];
    
    self.headerView.translatesAutoresizingMaskIntoConstraints = NO;
    self.bottomView.translatesAutoresizingMaskIntoConstraints = NO;
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.animateButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.animateBackgroundButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    #pragma mark - установка Констрейтов
    
    NSArray<NSLayoutConstraint *> *constraints =
        @[
          [self.headerView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
          [self.headerView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
          [self.headerView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
          [self.headerView.bottomAnchor constraintEqualToAnchor:self.view.centerYAnchor],
          
          [self.bottomView.topAnchor constraintEqualToAnchor:self.headerView.bottomAnchor],
          [self.bottomView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
          [self.bottomView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
          [self.bottomView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
          
          [self.imageView.centerYAnchor constraintEqualToAnchor:self.headerView.centerYAnchor],
          [self.imageView.centerXAnchor constraintEqualToAnchor:self.headerView.centerXAnchor],
          [self.imageView.heightAnchor constraintEqualToConstant:100.f],
          [self.imageView.widthAnchor constraintEqualToConstant:100.f],
          
          [self.animateButton.centerYAnchor constraintEqualToAnchor:self.bottomView.centerYAnchor],
          [self.animateButton.centerXAnchor constraintEqualToAnchor:self.bottomView.centerXAnchor],
          [self.animateButton.heightAnchor constraintEqualToConstant:40.f],
          [self.animateButton.widthAnchor constraintEqualToConstant:200.f],
          
          [self.animateBackgroundButton.topAnchor constraintEqualToAnchor:self.animateButton.bottomAnchor constant:8.f],
          [self.animateBackgroundButton.centerXAnchor constraintEqualToAnchor:self.bottomView.centerXAnchor],
          [self.animateBackgroundButton.heightAnchor constraintEqualToConstant:40.f],
          [self.animateBackgroundButton.widthAnchor constraintEqualToConstant:200.f],
          ];
    
    [NSLayoutConstraint activateConstraints:constraints];
    
    
    #pragma mark - Настройка ImageView
    
    self.imageView.layer.cornerRadius = 50.f;
    self.imageView.layer.masksToBounds = YES;
    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageView.layer.borderWidth = 3.f;
    self.imageView.image = [UIImage imageNamed:@"img1"];
}


#pragma mark - Метод нажатия кнопки

- (void) buttonDidTap:(UIButton *)button
{
    
    
    #pragma mark - Анимация увеличения
    
    CABasicAnimation *pulsingAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    pulsingAnimation.autoreverses = YES;
//    pulsingAnimation.duration = 1;
//    pulsingAnimation.repeatCount = INFINITY;
//    pulsingAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    pulsingAnimation.fillMode = kCAFillModeForwards;
    pulsingAnimation.fromValue = @(0.);
    pulsingAnimation.toValue = @(2.8);
//    pulsingAnimation.removedOnCompletion = NO;

//    CALayer *roundLayer = [CALayer new];
//    roundLayer.frame = CGRectMake(25., 25., 100., 100.);
//    roundLayer.cornerRadius = 50.;
//    roundLayer.backgroundColor = UIColor.blackColor.CGColor;
//    roundLayer.opacity = 0.7;
//
//    [self.imageView.layer addSublayer:roundLayer];
//    [self.imageView.layer addAnimation:pulsingAnimation forKey:@"pulsing"];
    
    
    #pragma mark - Анимация сдвига по оси Х
    
    CABasicAnimation *pulsingAnimationX = [CABasicAnimation animationWithKeyPath:@"position.x"];
//    pulsingAnimationX.autoreverses = YES;
//    pulsingAnimationX.duration = 1;
//    pulsingAnimationX.repeatCount = INFINITY;
//    pulsingAnimationX.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    pulsingAnimationX.fillMode = kCAFillModeForwards;
    pulsingAnimationX.fromValue = @(0.);
    pulsingAnimationX.toValue = @(self.view.frame.size.width - 150.f);
//    pulsingAnimationX.removedOnCompletion = NO;
//
//    [self.imageView.layer addAnimation:pulsingAnimationX forKey:@"pulsingX"];
    
    
    #pragma mark - Добавление анимаций в группу
    
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[pulsingAnimation, pulsingAnimationX];

    groupAnimation.autoreverses = YES;
    groupAnimation.duration = 1;
    groupAnimation.repeatCount = INFINITY;
    groupAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    groupAnimation.fillMode = kCAFillModeForwards;
    groupAnimation.removedOnCompletion = NO;
    
    [self.imageView.layer addAnimation:groupAnimation forKey:@"puls"];
    

}


#pragma mark - Метод анимации тени картинки

- (void) buttonShadowDidTap:(UIButton *)button
{

    CALayer* containerLayer = [CALayer layer];
    containerLayer.shadowColor = [UIColor blackColor].CGColor;
    containerLayer.shadowRadius = 0.f;
    containerLayer.shadowOffset = CGSizeMake(0.f, 0.f);
    containerLayer.shadowOpacity = 1.f;
    
    [containerLayer addSublayer:self.imageView.layer];
    [self.view.layer addSublayer:containerLayer];
    
    CABasicAnimation *shadowAnimation = [CABasicAnimation animationWithKeyPath:@"shadowPath"];
    

    shadowAnimation.autoreverses = YES;
    shadowAnimation.duration = 1;
    shadowAnimation.repeatCount = INFINITY;
    shadowAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    shadowAnimation.fillMode = kCAFillModeForwards;
    
    UIBezierPath *pathFrom = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.imageView.frame.origin.x,
                                                                           self.imageView.frame.origin.y,
                                                                           100.f,
                                                                           100.f)];
    
    UIBezierPath *pathTo = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.imageView.frame.origin.x - 15,
                                                                            self.imageView.frame.origin.y - 15,
                                                                            130.f,
                                                                            130.f)];
    
    shadowAnimation.fromValue = (__bridge id _Nullable)(pathFrom.CGPath);
    shadowAnimation.toValue = (__bridge id _Nullable)(pathTo.CGPath);
    
    shadowAnimation.removedOnCompletion = NO;

    [containerLayer addAnimation:shadowAnimation forKey:@"pulsingShadow"];

}

@end
