//
//  Pizzeria.h
//  PizzaPiBeta4
//
//  Created by Michael Sevy on 8/6/15.
//  Copyright (c) 2015 Michael Sevy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Pizzeria : NSObject

@property MKMapItem *mapItem;
@property float milesDifference;
//from data packet
@property NSString *name;
@property CLPlacemark *placemark;
@property NSString *phoneNumber;
@property NSURL *url;
@property NSString *address;

//self init properities
@property double intRadius;
@property double costOfPie;
@property MKRouteStep *eachStep;
@property NSString *eachStepInstruct;

@property float pricePerInchSq;










-(double)percentLgOverSmDigit:(double)costOfOne andTwo:(double)costOfTwo;

-(NSString *)pricePerInch:(double)radius andCost:(double)costOfPie;

-(instancetype)initWith:(double)radius andCost:(double)cost;



@end
