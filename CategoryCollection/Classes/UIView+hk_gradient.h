//
//  UIView+gradient.h
//  AnimationPractice
//
//  Created by HK on 2023/4/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (gradient)

/* 便捷方法，水平渐变 */
- (UIView *(^)(NSArray<UIColor *> *colors))hk_setHorizontalColors;
/* 便捷方法，垂直渐变 */
- (UIView *(^)(NSArray<UIColor *> *colors))hk_setVerticalColors;

- (UIView *(^)(NSArray<UIColor *> *colors))hk_setColors;
- (UIView *(^)(NSArray<NSNumber *> *locations))hk_setLocations;
- (UIView *(^)(CGPoint startPoint))hk_setStartPoint;
- (UIView *(^)(CGPoint endPoint))hk_setEndPoint;
- (UIView *(^)(CAGradientLayerType type))hk_setType;

@end

NS_ASSUME_NONNULL_END
