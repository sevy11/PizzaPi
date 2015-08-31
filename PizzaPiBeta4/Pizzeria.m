//
//  Pizzeria.m
//  PizzaPiBeta4
//
//  Created by Michael Sevy on 8/6/15.
//  Copyright (c) 2015 Michael Sevy. All rights reserved.
//

#import "Pizzeria.h"

@implementation Pizzeria


-(NSString *)pricePerInch:(double)radius andCost:(double)costOfPie    {

    self.intRadius = radius;
    self.costOfPie = costOfPie;
    float rSqaured = radius * radius;
    float areaOfPie = rSqaured * M_PI;
    float costPer = costOfPie / areaOfPie;
    NSString *newP = [NSString stringWithFormat:@"%.3f¢", costPer];
    return newP;
}







-(double)percentLgOverSmDigit:(double)costOfOne andTwo:(double)costOfTwo{
    double twoMinusOne  = costOfTwo - costOfOne;
    double divisorDifference = twoMinusOne / costOfOne;
    return divisorDifference;
}


-(instancetype)initWith:(double)radius andCost:(double)cost{

    self = [super init];
    if (self) {
        self.intRadius = radius;
        self.costOfPie = cost;
        
    }
    return self;
}


@end





