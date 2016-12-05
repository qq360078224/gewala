//
//  LawageAnimation.h
//  lawage
//
//  Created by apple on 16/9/2.
//  Copyright © 2016年 com.ruitai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    PRESENT = 0,
    DISMISS = 1,
    PUSH = 2,
    POP = 3,
}TransType;

@interface LawageAnimation : NSObject <UIViewControllerAnimatedTransitioning>
@property (nonatomic, assign) TransType type;

- (instancetype)initWithTransType:(TransType)tpye;
@end
