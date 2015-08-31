//
//  Color.m
//  PizzaPiBeta4
//
//  Created by Michael Sevy on 8/26/15.
//  Copyright (c) 2015 Michael Sevy. All rights reserved.
//

#import "Color.h"

@implementation Color

+ (UIColor *)pizzaRed    {
    return     [UIColor colorWithRed:174.0/255.0 green:15.0/255.0 blue:23.0/255.0 alpha:1.0];
}

+ (UIColor *)fontWhite
{
    return [UIColor colorWithRed:245.0/255.0 green:248.0/255.0 blue:250.0/255.0 alpha:1];
}

+ (UIColor *)fontBlack
{
    return [UIColor colorWithRed:41.0/255.0 green:47.0/255.0 blue:51.0/255.0 alpha:1];
}

+ (UIColor *)fontGray
{
    return [UIColor colorWithRed:102.0/255.0 green:117.0/255.0 blue:127.0/255.0 alpha:1];
}

+ (UIColor *)fontYellow
{
    return [UIColor colorWithRed:253.0/255.0 green:208.0/255.0 blue:0.0 alpha:1];
}

+ (UIColor *)fontRed
{
    return [UIColor colorWithRed:203.0/255.0 green:51.0/255.0 blue:28.0/255.0 alpha:1];
}


@end
