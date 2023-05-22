//
//  NSObject+hk_swizzle.h
//  AnimationPractice
//
//  Created by HK on 2023/4/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (hk_swizzle)
+ (void)hk_swizzleClassMethodWithOriginSel:(SEL)oriSel swizzledSel:(SEL)swiSel;
+ (void)hk_swizzleInstanceMethodWithOriginSel:(SEL)oriSel swizzledSel:(SEL)swiSel;
@end

NS_ASSUME_NONNULL_END
