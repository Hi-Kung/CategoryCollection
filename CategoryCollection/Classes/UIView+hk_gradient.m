//
//  UIView+hk_gradient.m
//  AnimationPractice
//
//  Created by HK on 2023/4/6.
//

#import "UIView+hk_gradient.h"
#import <objc/runtime.h>
#import "NSObject+hk_swizzle.h"

static const NSString * kgradentLayer = @"hk_gradentLayer";


@implementation UIView (gradient)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self hk_swizzleInstanceMethodWithOriginSel:@selector(layoutSubviews) swizzledSel:@selector(gradient_layoutSubviews)];
    });
}

- (void)gradient_layoutSubviews {
    [self gradient_layoutSubviews];
    CAGradientLayer *gradientLayer = objc_getAssociatedObject(self, &kgradentLayer);
    if (gradientLayer) {
        gradientLayer.frame = self.bounds;
    }
}


- (CAGradientLayer *)hk_gradientLayer {
    CAGradientLayer *layer = objc_getAssociatedObject(self, &kgradentLayer);
    if (layer == nil) {
        layer = [CAGradientLayer layer];
        layer.frame = self.bounds;
        objc_setAssociatedObject(self, &kgradentLayer, layer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return layer;
}


/* 便捷方法，水平渐变 */
- (UIView *(^)(NSArray<UIColor *> *colors))hk_setHorizontalColors {
    return ^UIView *(NSArray<UIColor *> *colors) {
        self.hk_setColors(colors).hk_setStartPoint(CGPointMake(0, 0.5)).hk_setEndPoint(CGPointMake(1, 0.5));
        return self;
    };
}
/* 便捷方法，垂直渐变 */
- (UIView *(^)(NSArray<UIColor *> *colors))hk_setVerticalColors {
    return ^UIView *(NSArray<UIColor *> *colors) {
        self.hk_setColors(colors);
        return self;
    };
}

- (UIView *(^)(NSArray<UIColor *> *colors))hk_setColors {
    return ^UIView *(NSArray<UIColor *> *colors) {
        NSMutableArray *cgColors = [NSMutableArray arrayWithCapacity:colors.count];
        for (UIColor *color in colors) {
            [cgColors addObject:(__bridge id)color.CGColor];
        }
        self.hk_gradientLayer.colors = cgColors;
        [self insertGradientLayerIfNeeded];
        return self;
    };
}

- (UIView *(^)(NSArray<NSNumber *> *locations))hk_setLocations {
    return ^UIView *(NSArray<NSNumber *> *locations) {
        self.hk_gradientLayer.locations = locations;
        [self insertGradientLayerIfNeeded];
        return self;
    };
}

- (UIView *(^)(CGPoint startPoint))hk_setStartPoint {
    return ^UIView *(CGPoint startPoint) {
        self.hk_gradientLayer.startPoint = startPoint;
        [self insertGradientLayerIfNeeded];
        return self;
    };
}

- (UIView *(^)(CGPoint endPoint))hk_setEndPoint {
    return ^UIView *(CGPoint endPoint) {
        self.hk_gradientLayer.endPoint = endPoint;
        [self insertGradientLayerIfNeeded];
        return self;
    };
}

- (UIView *(^)(CAGradientLayerType type))hk_setType {
    return ^UIView *(CAGradientLayerType type) {
        self.hk_gradientLayer.type = type;
        [self insertGradientLayerIfNeeded];
        return self;
    };
}


- (void)insertGradientLayerIfNeeded {
    if (!self.hk_gradientLayer.superlayer) {
        [self.layer insertSublayer:self.hk_gradientLayer atIndex:0];
    }
}


@end
