//
//  Example.h
//  FitUtil
//
//  Created by 刘祥建 on 2017/7/21.
//  Copyright © 2017年 LXJ. All rights reserved.
//

#ifndef Example_h
#define Example_h

#import "FitEncode.h"
#import "FitDecode.h"

#include "fit.hpp"

@interface Example : NSObject

- (FIT_UINT8)encode;
- (FIT_UINT8)decode;
- (const char *)readOnlyParam;
- (const char *)writeOnlyParam;
- (FILE *)openFileWithParams:(const char *)params;

+ (NSString *)stringForWString:(FIT_WSTRING)wString;

@property NSString *fileName;
@property FitEncode *fe;
@property FitDecode *fd;

@end


#endif /* Example_h */
