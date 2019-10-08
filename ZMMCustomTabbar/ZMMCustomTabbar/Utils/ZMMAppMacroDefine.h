//
//  ZMMAppMacroDefine.h
//  ZMMTabbar
//
//  Created by miao on 2019/8/13.
//  Copyright © 2019年 miao. All rights reserved.
//

#ifndef ZMMAppMacroDefine_h
#define ZMMAppMacroDefine_h

//单例
#undef ZMMSINGLETONDECLEAR
#define ZMMSINGLETONDECLEAR( ... ) \
- (instancetype)sharedInstance; \
+ (instancetype)sharedInstance;


#undef ZMMSINGLETONIMPLEMENT
#define ZMMSINGLETONIMPLEMENT( ... ) \
- (instancetype)sharedInstance \
{ \
return [[self class] sharedInstance]; \
} \
+ (instancetype)sharedInstance \
{ \
static dispatch_once_t once; \
static id __singleton__; \
dispatch_once( &once, ^{ __singleton__ = [[self alloc] init]; } ); \
return __singleton__; \
}


#import <UIKit/UIKit.h>

#endif /* ZMMAppMacroDefine_h */
