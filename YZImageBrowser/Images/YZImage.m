//
//  YZImage.m
//  FlashDev
//
//  Created by Lakeside on 2019/2/6.
//  Copyright © 2019 Shin. All rights reserved.
//

#import "YZImage.h"

@implementation YZImage

+(UIImage *)imageWithURL:(NSString *)imageURL
{
    if (!imageURL
        ||imageURL.length == 0)
    {
        return nil;
    }
    
    return [UIImage new];
}

@end
