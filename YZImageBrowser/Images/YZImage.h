//
//  YZImage.h
//  FlashDev
//
//  Created by Lakeside on 2019/2/6.
//  Copyright © 2019 Shin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 1.所有图片缓存均在caches/__Image 里.
 2.所有图片,先读取缓存,有则直接显示,没有缓存则下载,下载完成后再次读取.
 3.文件存储格式:__image_(图片源中的路径).jpg(png....)
 */

NS_ASSUME_NONNULL_BEGIN

@interface YZImage : NSObject

+ (UIImage *)imageWithURL:(NSString *)imageURL;

@end

NS_ASSUME_NONNULL_END
