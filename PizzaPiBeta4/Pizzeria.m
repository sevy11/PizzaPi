//
//  Pizzeria.m
//  PizzaPiBeta4
//
//  Created by Michael Sevy on 8/6/15.
//  Copyright (c) 2015 Michael Sevy. All rights reserved.
//

#import "Pizzeria.h"

@implementation Pizzeria





-(double)pricePerInch:(double)radius andCost:(double)costOfPie    {

    self.intRadius = radius;
    self.costOfPie = costOfPie;
    float rSqaured = radius * radius;
    float areaOfPie = rSqaured * M_PI;
    float costPer = costOfPie / areaOfPie;
    return costPer;

}



-(instancetype)initWith:(NSString *)sizeAndCost andSizeInt:(double) intRadius andCost:(double)cost andName:(NSString *)pizzeriaName andImage:(UIImage *)image{

    self = [super init];
    if (self) {
        self.intRadius = intRadius;
        self.costOfPie = cost;
        self.sizeAndCost = sizeAndCost;
        self.locationImage = image;
        self.pizzeriaName = pizzeriaName;
    }
    return self;
}




@end





