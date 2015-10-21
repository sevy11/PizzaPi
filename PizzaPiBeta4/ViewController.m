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
#import <Contacts/Contacts.h>
#import "Color.h"
#import <MapKit/MKAnnotation.h>



@interface ViewController () <CLLocationManagerDelegate, UITableViewDataSource, UITableViewDelegate, MKMapViewDelegate>

@property CLLocationManager *locationManager;
@property CLLocation *currentLocation;

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property NSArray *pizzaPlacesArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.pizzaPlacesArray = [NSArray new];
    self.tableView.delegate = self;
    self.mapView.delegate = self;
    self.automaticallyAdjustsScrollViewInsets = NO;

    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationItem.title = @"Pick Your Pizzeria!";
    self.navigationController.navigationBar.barTintColor = [Color pizzaRed];

    //set current location
    self.locationManager = [CLLocationManager new];
    self.locationManager.delegate = self;

    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }

    [self.locationManager startUpdatingLocation];
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager requestAlwaysAuthorization];
    _locationManager.distanceFilter = kCLDistanceFilterNone;
    _locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    self.locationManager.allowsBackgroundLocationUpdates = YES;

    NSLog(@"latitude %f & longitude: %f", self.locationManager.location.coordinate.latitude, self.locationManager.location.coordinate.latitude);

    

/*old
    [self updateCurrentLocation];
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8) {
        [self.locationManager requestAlwaysAuthorization];
        self.mapView.showsUserLocation = YES;
    }
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9) {
        self.locationManager.allowsBackgroundLocationUpdates = YES;
        self.mapView.showsUserLocation = YES;
    }

    [self.locationManager startUpdatingLocation];
*/
}

    //making a custom method to grab the users current location
//-(void)updateCurrentLocation
//{
    //calling the method- requestAlwaysAuthorization on the locationManager
        //    [self.locationManager requestAlwaysAuthorization];
        //    self.mapView.showsUserLocation = YES;
        //    [self.locationManager startUpdatingLocation];
        //}

//the other pins besides current location
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation    {
    //so this will run for everything except the current location
    if (![annotation isEqual:mapView.userLocation]) {

        MKPinAnnotationView *pin = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:nil];
        pin.pinTintColor = [UIColor purpleColor];
        pin.canShowCallout = YES;
        pin.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        return pin;

    } else  {
        return nil;
    }
}


-(void)geocodeLocation:(NSString *)locationString
{
    NSString *address = locationString;
    CLGeocoder *geocoder = [CLGeocoder new];
    [geocoder geocodeAddressString:address completionHandler:^(NSArray *placemarks, NSError *error) {
        for (CLPlacemark *place in placemarks) {
            //annotation implementation
            MKPointAnnotation *annotation = [MKPointAnnotation new];
            annotation.coordinate = place.location.coordinate;

            annotation.title = place.name;


            [self.mapView addAnnotation:annotation];
        }
    }];
}

-(void)findPizzerias:(CLLocation *)location
{
    //inilize new mklocalsearchrequest of naturallaguage and local region
    MKLocalSearchRequest *request = [MKLocalSearchRequest new];
    request.naturalLanguageQuery = @"pizza";
    request.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.01, 0.01));//measeured in degree, 1 degree = 69 miles so .05 = 5% of that 69 miles range around the local gps of the phone

    //init the search request with a block for the response
    MKLocalSearch *search = [[MKLocalSearch alloc] initWithRequest:request];
    [search startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        //make two array, one for the mapItems on for later to sort
        NSArray *mapItems = response.mapItems;
        NSMutableArray *temporaryArray = [NSMutableArray new];

            for (MKMapItem *mapItem in mapItems) {

            //user location in meters
            CLLocationDistance metersAway = [mapItem.placemark.location distanceFromLocation:location];
            float milesDifference = metersAway / 1609.34;
            Pizzeria *pizza = [Pizzeria new];
            pizza.mapItem = mapItem;
            pizza.milesDifference = milesDifference;
        
            [temporaryArray addObject:pizza];

            pizza.name = pizza.mapItem.name;
            pizza.placemark = pizza.mapItem.placemark; //clplacemark object
            NSDictionary *dict = pizza.placemark.addressDictionary;
            NSString *stringy = [dict objectForKey:@"Street"];
            pizza.address = stringy;
            //NSLog(@"name: %@", pizza.name);

            pizza.phoneNumber = pizza.mapItem.phoneNumber;
            pizza.url = pizza.mapItem.url;
        }

        //sort the array by distance from user
        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"milesDifference" ascending:true];
        NSArray *sortedArray = [temporaryArray sortedArrayUsingDescriptors:@[sortDescriptor]];

        self.pizzaPlacesArray = [NSArray arrayWithArray:sortedArray];

        Pizzeria *pizza = [self.pizzaPlacesArray objectAtIndex:0];
        if (pizza.address) {
            [self geocodeLocation:pizza.address];
        }
        Pizzeria *pizza1 = [self.pizzaPlacesArray objectAtIndex:1];
        if (pizza1.address) {
            [self geocodeLocation:pizza1.address];
        }
        Pizzeria *pizza2 = [self.pizzaPlacesArray objectAtIndex:2];
        if (pizza2.address) {
            [self geocodeLocation:pizza2.address];
        }
        Pizzeria *pizza3 = [self.pizzaPlacesArray objectAtIndex:3];
        if (pizza3.address) {
            [self geocodeLocation:pizza3.address];
        }
        Pizzeria *pizza4 = [self.pizzaPlacesArray objectAtIndex:4];
        if (pizza4.address) {
            [self geocodeLocation:pizza4.address];
        }
        Pizzeria *pizza5 = [self.pizzaPlacesArray objectAtIndex:5];
        if (pizza5.address) {
            [self geocodeLocation:pizza5.address];
        }
        Pizzeria *pizza6 = [self.pizzaPlacesArray objectAtIndex:6];
        if (pizza6.address) {
            [self geocodeLocation:pizza6.address];
        }
        Pizzeria *pizza7 = [self.pizzaPlacesArray objectAtIndex:7];
        if (pizza7.address) {
            [self geocodeLocation:pizza7.address];
        }
        Pizzeria *pizza8 = [self.pizzaPlacesArray objectAtIndex:8];
        if (pizza8.address) {
            [self geocodeLocation:pizza8.address];
        }
        Pizzeria *pizza9 = [self.pizzaPlacesArray objectAtIndex:9];
        if (pizza9.address) {
            [self geocodeLocation:pizza9.address];
        }

        [self.tableView reloadData];
    }];


}


-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    self.currentLocation = locations.firstObject;
    NSLog(@"locaiton: %@", self.currentLocation);
    [self.locationManager stopUpdatingLocation];

    //search for Pizerias
    [self findPizzerias:self.currentLocation];
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{

    MKCoordinateRegion region;
    region.center = mapView.userLocation.coordinate;
    NSLog(@"in method locale: %@", mapView.userLocation);
    region.span.latitudeDelta = 0.012;
    region.span.longitudeDelta = 0.012;


    [mapView setRegion:region animated:YES];
}


#pragma mark - tableView delegates
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.pizzaPlacesArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    Pizzeria *pizza = [self.pizzaPlacesArray objectAtIndex:indexPath.row];
    //displays objects from the array with the added Pizza objects were added above
    NSString *currentValue = [[[self.pizzaPlacesArray objectAtIndex:indexPath.row] mapItem]name];
    [[cell textLabel]setText:currentValue];
    cell.detailTextLabel.text = pizza.address;

    return cell;
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    DetailViewController *detailVC = segue.destinationViewController;
    detailVC.pizzaPlace = [self.pizzaPlacesArray objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    detailVC.currentLocation = self.currentLocation;
    detailVC.arrayForPizzaPlaces = self.pizzaPlacesArray;
}



@end
