//
//  LawageTrans.m
//  lawage
//
//  Created by apple on 16/9/2.
//  Copyright © 2016年 com.ruitai. All rights reserved.
//

#import "LawageTrans.h"
#import "LawageAnimation.h"

@implementation LawageTrans
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    LawageAnimation *ani = [[LawageAnimation alloc] initWithTransType:PRESENT];
    return  ani;
}
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    LawageAnimation *ani = [[LawageAnimation alloc] initWithTransType:DISMISS];
    return  ani;
}
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{

    switch (operation) {
        case UINavigationControllerOperationPush:
        {
            LawageAnimation *ani = [[LawageAnimation alloc] initWithTransType:PUSH];
            return  ani;
        }
            break;
        case UINavigationControllerOperationPop:
        {
            
            LawageAnimation *ani = [[LawageAnimation alloc] initWithTransType:POP];
            return  ani;
        }
            break;
        default:
            break;
    }

    return nil;

}
@end
