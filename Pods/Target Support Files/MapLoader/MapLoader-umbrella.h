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

#import "Cluster.h"
#import "MapLoader.h"

FOUNDATION_EXPORT double MapLoaderVersionNumber;
FOUNDATION_EXPORT const unsigned char MapLoaderVersionString[];

