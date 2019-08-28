//
//  YZImageModel.h
//  YZImageBrowser
//
//  Created by Xin.YaZhuang on 2019/8/27.
//  Copyright © 2019 Shin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, kYZImageType)
{
    kYZImageType_Image,
    kYZImageType_GIF,
    kYZImageType_Video,
};

@interface YZImageModel : NSObject

@property (nonatomic, assign) kYZImageType type ;

@property (nonatomic, copy) NSString *imageURL ;
@property (nonatomic, copy) NSString *imageName ;

@property (nonatomic, assign) BOOL isGIF ;
@property (nonatomic, assign) BOOL isLong ;

///thumbnail
@property (nonatomic, copy) NSString *thumbnailURL ;
@property (nonatomic, copy) NSString *thumbnailName ;


@end

NS_ASSUME_NONNULL_END
