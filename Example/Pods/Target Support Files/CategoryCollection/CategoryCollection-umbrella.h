#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "NSObject+hk_swizzle.h"
#import "UIView+hk_gradient.h"

FOUNDATION_EXPORT double CategoryCollectionVersionNumber;
FOUNDATION_EXPORT const unsigned char CategoryCollectionVersionString[];

