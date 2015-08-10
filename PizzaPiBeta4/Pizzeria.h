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

//self init properities
@property NSString *pizzeriaName;
@property NSString *sizeAndCost;
@property UIImage *locationImage;
@property double intRadius;
@property double costOfPie;
@property UIColor *peporoni;



-(double)pricePerInch:(double)radius andCost:(double)costOfPie;

-(instancetype)initWith:(NSString *)sizeAndCost andSizeInt:(double) intRadius andCost:(double)cost andName:(NSString *)pizzeriaName andImage:(UIImage *)image;



@end
