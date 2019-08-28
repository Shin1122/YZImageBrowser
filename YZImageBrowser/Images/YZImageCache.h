//
//  YZImageCache.h
//  FlashDev
//
//  Created by Lakeside on 2019/2/6.
//  Copyright © 2019 Shin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YZImageCache : NSObject

+ (NSString *)cacheFilePathWithImageURL:(NSString *)imageURL;

+ (BOOL)containImageCachedWithImageURL:(NSString *)imageURL;

+ (void)removeImageWithImageURL:(NSString *)imageURL;

@end

NS_ASSUME_NONNULL_END
