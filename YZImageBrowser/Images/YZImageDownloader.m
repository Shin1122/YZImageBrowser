//
//  YZImageDownloader.m
//  FlashDev
//
//  Created by Lakeside on 2019/2/6.
//  Copyright © 2019 Shin. All rights reserved.
//

#import "YZImageDownloader.h"
#import "YZImageCache.h"

@implementation YZImageDownloader

static NSMutableArray *kImageDownloaderQueue = nil;


+(void)downloadImageWithImageURL:(NSString *)imageURL
                downloadedProgress:(void (^)(float))downloadedProgress
     didDownloadRequestCompleted:(nonnull void (^)(NSError * _Nullable,
                                                   NSString * _Nullable,
                                                   UIImage * _Nullable))didDownloadRequestCompleted
{
    
//    NSString *imagePath
//    = @"http://www.gamersky.com/showimage/id_gamersky.shtml?https://img1.gamersky.com/upimg/pic/2019/02/01/201902011636305797.jpg";
    
    if ([YZImageCache containImageCachedWithImageURL:imageURL])
    {
        UIImage *image
        = [UIImage imageWithContentsOfFile:[YZImageCache cacheFilePathWithImageURL:imageURL]];
        if (image)
        {
            downloadedProgress(1.0);
            didDownloadRequestCompleted(nil,
                                        [YZImageCache cacheFilePathWithImageURL:imageURL],
                                        image);
            return;
        }
    }
    
    if (!kImageDownloaderQueue)
    {
        kImageDownloaderQueue
        = [[NSMutableArray alloc]init];
    }
    
    NSURLSessionConfiguration *config
    = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager
    = [[AFURLSessionManager alloc] initWithSessionConfiguration:config];
    NSURLRequest *request
    = [NSURLRequest requestWithURL:[NSURL URLWithString:imageURL]];
    ////
    [kImageDownloaderQueue addObject:request];
    ///
    NSURLSessionDownloadTask *downloadTask
    = [manager downloadTaskWithRequest:request
                              progress:
       ^(NSProgress * _Nonnull downloadProgress)
       {
           downloadedProgress(downloadProgress.completedUnitCount/downloadProgress.totalUnitCount);
       }
                           destination:
       ^NSURL * _Nonnull(NSURL * _Nonnull targetPath,
                         NSURLResponse * _Nonnull response)
       {
           return [NSURL fileURLWithPath:[YZImageCache cacheFilePathWithImageURL:response.URL.absoluteString]];
       }
                     completionHandler:
       ^(NSURLResponse * _Nonnull response,
         NSURL * _Nullable filePath,
         NSError * _Nullable error)
       {
          NSString *imageFilePath
           = filePath.absoluteString;
           
           if ([imageFilePath containsString:@"file://"])
           {
               imageFilePath
               = [imageFilePath stringByReplacingOccurrencesOfString:@"file://"
                                                          withString:@""];
           }
           
           didDownloadRequestCompleted(error,
                                       filePath.absoluteString,
                                       [UIImage imageWithContentsOfFile:imageFilePath]);
           NSURLRequest *requestNeedToRemoved
           = nil;
           for (NSURLRequest *req in kImageDownloaderQueue)
           {
               if ([req.URL.absoluteString isEqualToString:response.URL.absoluteString])
               {
                   requestNeedToRemoved
                   = req;
                   break;
               }
           }
           if (requestNeedToRemoved
               &&[kImageDownloaderQueue containsObject:requestNeedToRemoved])
           {
               [kImageDownloaderQueue removeObject:requestNeedToRemoved];
           }
       }];
    [downloadTask resume];
}

@end
