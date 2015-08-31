//
//  DetailViewController.h
//  PizzaPiBeta4
//
//  Created by Michael Sevy on 8/6/15.
//  Copyright (c) 2015 Michael Sevy. All rights reserved.
//

#import "ViewController.h"
#import "Pizzeria.h"
@interface DetailViewController : ViewController

@property Pizzeria *pizzaPlace;
@property CLLocation *currentLocation;
@property CLLocation *destinationLocation;
@property NSArray *arrayForPizzaPlaces;

@end

