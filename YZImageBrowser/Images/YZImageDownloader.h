//
//  YZImageDownloader.h
//  FlashDev
//
//  Created by Lakeside on 2019/2/6.
//  Copyright © 2019 Shin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface YZImageDownloader : NSObject

+ (void)downloadImageWithImageURL:(NSString *)imageURL
                 downloadedProgress:(void(^)(float downloadProgress))downloadedProgress
      didDownloadRequestCompleted:(void(^)(NSError *err,
                                           NSString *cacheFilePath,
                                           UIImage *image))didDownloadRequestCompleted;

@end

NS_ASSUME_NONNULL_END
