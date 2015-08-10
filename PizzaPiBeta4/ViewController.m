//
//  ViewController.m
//  PizzaPiBeta4
//
//  Created by Michael Sevy on 8/6/15.
//  Copyright (c) 2015 Michael Sevy. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Pizzeria.h"
#import "DetailViewController.h"

@interface ViewController () <CLLocationManagerDelegate, UITableViewDataSource, UITableViewDelegate>

@property CLLocationManager *locationManager;
@property CLLocation *currentLocation;
@property NSArray *pizzaPlacesArray;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationItem.title = @"Pick Your Pizzeria!";
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];

    self.locationManager = [CLLocationManager new];
    self.locationManager.delegate = self;
    [self updateCurrentLocation];
    self.tableView.delegate = self;
}
//making a custom method to grab the users current location
-(void)updateCurrentLocation
{
    //calling the method- requestAlwaysAuthorization on the locationManager
    [self.locationManager requestAlwaysAuthorization];
    [self.locationManager startUpdatingLocation];
}
-(void)findPizzerias:(CLLocation *)location
{
    //inilize new mklocalsearchrequest of naturallaguage and local region
    MKLocalSearchRequest *request = [MKLocalSearchRequest new];
    request.naturalLanguageQuery = @"pizza";
    request.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(1, 1));//measeured in degree, 1 degree = 69 miles so .05 = 5% of that 69 miles range around the local gps of the phone

    //init the search request with a block for the response
    MKLocalSearch *search = [[MKLocalSearch alloc] initWithRequest:request];
    [search startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        //make two array, one for the mapItems on for later to sort
        NSArray *mapItems = response.mapItems;
        NSMutableArray *temporaryArray = [NSMutableArray new];

        //run a for loop for 5 items, incrementing thru them one at a time
        for (float i = 0; i < 10; i++)
        {
            MKMapItem *mapItem = [mapItems objectAtIndex:i];

            //user location in meters
            CLLocationDistance metersAway = [mapItem.placemark.location distanceFromLocation:location];
            float milesDifference = metersAway / 1609.34;

            //initn the new Location coffee place locally
            Pizzeria *pizza = [Pizzeria new];
            pizza.mapItem = mapItem;
            pizza.milesDifference = milesDifference;

            //add the new class to the mutable array and print it
            [temporaryArray addObject:pizza];

            pizza.name = pizza.mapItem.name;
            pizza.placemark = pizza.mapItem.placemark; //cllocation object
            pizza.phoneNumber = pizza.mapItem.phoneNumber;
            pizza.url = pizza.mapItem.url;//url object
            
        }

        //init the the sort descriptor with teh key
        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"milesDifference" ascending:true];
        NSArray *sortedArray = [temporaryArray sortedArrayUsingDescriptors:@[sortDescriptor]];

        self.pizzaPlacesArray = [NSArray arrayWithArray:sortedArray];

        [self.tableView reloadData];
    }];
}


-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    self.currentLocation = locations.firstObject;
    NSLog(@"%@", self.currentLocation);
    [self.locationManager stopUpdatingLocation];
    //search for Pizerias
    [self findPizzerias:self.currentLocation];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.pizzaPlacesArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];

    //displays objects from the array with the added Pizza objects were added above
    NSString *currentValue = [[[self.pizzaPlacesArray objectAtIndex:indexPath.row] mapItem]name];
    [[cell textLabel]setText:currentValue];

    return cell;

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailViewController *detailVC = segue.destinationViewController;
    detailVC.pizzaPlace = [self.pizzaPlacesArray objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    detailVC.currentLocation = self.currentLocation;

}



@end
