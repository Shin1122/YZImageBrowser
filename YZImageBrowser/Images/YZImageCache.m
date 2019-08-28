//
//  YZImageCache.m
//  FlashDev
//
//  Created by Lakeside on 2019/2/6.
//  Copyright © 2019 Shin. All rights reserved.
//

#import "YZImageCache.h"

@implementation YZImageCache

+ (BOOL)containImageCachedWithImageURL:(NSString *)imageURL
{
    if (!imageURL
        ||imageURL.length == 0)
    {
        return NO;
    }
    
    return [[NSFileManager defaultManager]fileExistsAtPath:[YZImageCache cacheFilePathWithImageURL:imageURL]];
}


+ (void)removeImageWithImageURL:(NSString *)imageURL
{
    if ([YZImageCache containImageCachedWithImageURL:imageURL])
    {
        NSError *error
        = [[NSError alloc]init];
        [[NSFileManager defaultManager]
         removeItemAtPath:[YZImageCache cacheFilePathWithImageURL:imageURL]
         error:&error];
    }
}


+(NSString *)cacheFilePathWithImageURL:(NSString *)imageURL
{
    if (!imageURL
        ||imageURL.length == 0)
    {
        return nil;
    }
    
    NSString *cacheDir
    = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,
                                          NSUserDomainMask,
                                          YES)[0];
    
    BOOL isDic
    = YES;
    if (![[NSFileManager defaultManager]fileExistsAtPath:[cacheDir stringByAppendingString:@"/__image__"] isDirectory:&isDic])
    {
        [[NSFileManager defaultManager]createDirectoryAtPath:[cacheDir stringByAppendingString:@"/__image__"]
                                 withIntermediateDirectories:YES
                                                  attributes:nil
                                                       error:nil];
    }
    
    if ([imageURL containsString:@"://"])
    {
        imageURL
        = [imageURL stringByReplacingOccurrencesOfString:@"://"
                                              withString:@"__"];
    }
    
    imageURL
    = [imageURL stringByReplacingOccurrencesOfString:@"/"
                                          withString:@"_"];
    
    cacheDir
    = [cacheDir stringByAppendingPathComponent:@"__image__"];
    imageURL
    = [cacheDir stringByAppendingPathComponent:imageURL];
    
    return imageURL;
}

@end
