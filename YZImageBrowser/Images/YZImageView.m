//
//  YZImageView.m
//  FlashDev
//
//  Created by Lakeside on 2019/2/7.
//  Copyright © 2019 Shin. All rights reserved.
//

#import "YZImageView.h"
#import "YZImageDownloader.h"

@implementation YZImageView

-(void)setImageURL:(NSString *)imageURL
{
    if (!imageURL
        ||imageURL.length == 0)
    {
        return;
    }
    
    _imageURL
    = imageURL;
    
    [YZImageDownloader downloadImageWithImageURL:_imageURL
                                downloadedProgress:
     ^(float downloadedProgress)
     {
         
     }
                     didDownloadRequestCompleted:
     ^(NSError * _Nonnull err,
       NSString * _Nonnull cacheFilePath,
       UIImage * _Nonnull image)
     {
         if (!err)
         {
             if (image)
             {
                 self.image
                 = image;
             }
         }
     }];
}

@end
