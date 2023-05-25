//
//  UIColor+DYTColor.m
//  Doctor_dyt
//
//  Created by DYT on 2019/8/28.
//  Copyright © 2019 DYT. All rights reserved.
//

#import "UIColor+DYTColor.h"

@implementation UIColor (DYTColor)



+ (UIColor *)dytRandomColor {
//    [UIColor colorWithRed:(arc4random_uniform(256))/255.0f green:(arc4random_uniform(156))/255.0f blue:(arc4random_uniform(156))/255.0f alpha:(1)]
    return [UIColor colorWithRed:(arc4random_uniform(256))/255.0f green:(arc4random_uniform(156))/255.0f blue:(arc4random_uniform(156))/255.0f alpha:(1)];
}

@end
