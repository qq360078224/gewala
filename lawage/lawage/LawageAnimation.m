//
//  LawageAnimation.m
//  lawage
//
//  Created by apple on 16/9/2.
//  Copyright © 2016年 com.ruitai. All rights reserved.
//

#import "LawageAnimation.h"
#import "ViewController.h"
#import "ViewController1.h"
@interface LawageAnimation()
@property (weak, nonatomic)  id transitionContext;
@end

@implementation LawageAnimation
- (instancetype)initWithTransType:(TransType)tpye {
    self = [super init];
    if (self) {
        self.type = tpye;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerTransitioningDelegate>)transitionContext {
    return  0.5;
}
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    switch (self.type) {
        case PRESENT:
        {
            [self setGoTransAnimationWithContext:transitionContext];
        }
            break;
        case DISMISS:
        {
            [self setBackTransAnimationWithContext:transitionContext];
        }
            break;
        case PUSH:
        {
            [self setGoTransAnimationWithContext:transitionContext];
        }
            break;
        case POP:
        {
            [self setBackTransAnimationWithContext:transitionContext];
        }
            break;
        default:
            break;
    }

}
- (void)setGoTransAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {

    self.transitionContext = transitionContext;
    UIView *containerView = [transitionContext containerView];
    ViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    ViewController1 *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
   
    UIButton *btn = [[fromVC.childViewControllers lastObject] btn];
    [containerView addSubview:toVC.view];

    [self createBezierPathFromOrigin:btn.frame toFinal:CGRectInset(btn.frame, -936, -936) andTempVC:toVC];

}
- (void)setBackTransAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {

    self.transitionContext = transitionContext;
    UIView *containerView = [transitionContext containerView];
    ViewController1 *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    ViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIButton *btn = fromVC.btn;

    [containerView addSubview:toVC.view];
    [containerView addSubview:fromVC.view];

    [self createBezierPathFromOrigin:CGRectInset(btn.frame, -736, -736) toFinal:btn.frame andTempVC:fromVC];

}
- (void)createBezierPathFromOrigin:(CGRect)origin toFinal:(CGRect)final andTempVC:(UIViewController *)vc {
    UIBezierPath *originPath = [UIBezierPath bezierPathWithOvalInRect:origin];
    UIBezierPath *finalPath = [UIBezierPath bezierPathWithOvalInRect:final];

    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.backgroundColor = [UIColor greenColor].CGColor;
    maskLayer.path = finalPath.CGPath;
    vc.view.layer.mask = maskLayer;

    [self addPathAnimationFromOriginPath:originPath toFinalPath:finalPath WithLayer:maskLayer];
}
- (void)addPathAnimationFromOriginPath:(UIBezierPath *)origin toFinalPath:(UIBezierPath *)final WithLayer:(CAShapeLayer *)layer {
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"path"];
    ani.fromValue = (__bridge id _Nullable)(origin.CGPath);
    ani.toValue =   (__bridge id _Nullable)(final.CGPath);
    ani.duration = [self transitionDuration:self.transitionContext];
    ani.removedOnCompletion = NO;
    ani.fillMode = kCAFillModeForwards;
    ani.delegate = self;
    [layer addAnimation:ani forKey:nil];
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {

    [self.transitionContext completeTransition:![self.transitionContext transitionWasCancelled]];
    [self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;
}

@end

