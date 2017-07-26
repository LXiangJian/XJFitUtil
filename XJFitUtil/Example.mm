//
//  Example.m
//  FitUtil
//
//  Created by 刘祥建 on 2017/7/21.
//  Copyright © 2017年 LXJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Example.h"

@implementation Example

@synthesize fileName;
@synthesize fe;
@synthesize fd;

- (id)init
{
    self = [super init];
    if(self)
    {
        fileName = @"";
        fe = NULL;
        fd = NULL;
    }
    return self;
}

- (const char *)readOnlyParam
{
    return "rb";
}

- (const char *)writeOnlyParam
{
    return "wb+";
}

- (FILE *)openFileWithParams:(const char *)params
{
    NSString *docsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [docsPath stringByAppendingPathComponent:fileName];
    return fopen([filePath UTF8String], params);
}

+ (NSString *)stringForWString:(FIT_WSTRING)wString
{
    return [[NSString alloc] initWithBytes:wString.data() length:wString.size() * sizeof(wchar_t) encoding:NSUTF32LittleEndianStringEncoding];
}

- (FIT_UINT8)encode
{
    return -1;
}

- (FIT_UINT8)decode
{
    return -1;
}

@end
