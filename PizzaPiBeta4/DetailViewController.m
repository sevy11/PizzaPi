//
//  DetailViewController.m
//  PizzaPiBeta4
//
//  Created by Michael Sevy on 8/6/15.
//  Copyright (c) 2015 Michael Sevy. All rights reserved.
//

#import "DetailViewController.h"
#import "Pizzeria.h"
#import "PizzaCollectionViewCell.h"
#import "WebViewController.h"
#import "Color.h"

@interface DetailViewController ()<UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *webButton;
@property (weak, nonatomic) IBOutlet UILabel *labelOne;
@property (weak, nonatomic) IBOutlet UILabel *labelTwo;
@property (weak, nonatomic) IBOutlet UILabel *labelThree;
@property (weak, nonatomic) IBOutlet UILabel *labelFour;
@property (weak, nonatomic) IBOutlet UILabel *labelFive;
@property (weak, nonatomic) IBOutlet UILabel *labelSix;
@property (weak, nonatomic) IBOutlet UILabel *labelSeven;
@property (weak, nonatomic) IBOutlet UILabel *labelEight;
@property (weak, nonatomic) IBOutlet UILabel *labelNine;
@property (weak, nonatomic) IBOutlet UILabel *labelTen;
@property (weak, nonatomic) IBOutlet UILabel *labelEleven;
@property (weak, nonatomic) IBOutlet UILabel *labelTwelve;

@property (weak, nonatomic) IBOutlet UIButton *callButton;


@property NSString *phoneNumberForDialing;
@property NSString *phoneStrig;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *backgorundImage;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segControl;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIView *midView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    self.automaticallyAdjustsScrollViewInsets = NO;
    self.segControl.selectedSegmentIndex = 0;
    [self getPathDirectionsWalking:self.currentLocation.coordinate withDestination:self.pizzaPlace.mapItem.placemark.location.coordinate];

    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationItem.title = self.pizzaPlace.name;
    self.navigationController.navigationBar.barTintColor = [Color pizzaRed];

    self.webButton.layer.cornerRadius = 6;
    self.webButton.backgroundColor = [Color pizzaRed];
    self.callButton.backgroundColor = [Color pizzaRed];
    self.callButton.layer.cornerRadius = 6;
    [self.callButton sizeToFit];
    NSLog(@"pizza place selected: %@", self.pizzaPlace.name);
    if ([self.pizzaPlace.name containsString:@"Piece"]) {
        NSLog(@"Piece seen");
    }

    //phone number for dialing
    NSMutableString *oldString = [NSMutableString stringWithString:self.pizzaPlace.phoneNumber];
    NSString *oldestString = [oldString substringFromIndex:2];
    NSMutableString *phoneString = [NSMutableString stringWithString:oldestString];
    self.phoneNumberForDialing = phoneString;
    NSLog(@"phone number for dialing: %@", self.phoneNumberForDialing);

//      for display
//    [phoneString insertString:@"Call:" atIndex:0];
//    [phoneString insertString:@"(" atIndex:6];
//    [phoneString insertString:@")" atIndex:10];
//    [phoneString insertString:@" " atIndex:11];
//    [phoneString insertString:@"-" atIndex:14];
//    self.pizzaPlace.phoneNumber = phoneString;
//    self.phoneStrig = phoneString;



    //Lou's
    Pizzeria *lou1 = [[Pizzeria alloc]initWith: 6 andCost:9.50];
    Pizzeria *lou2 = [[Pizzeria alloc]initWith: 7 andCost:12.50];
    Pizzeria *lou3 = [[Pizzeria alloc]initWith: 8 andCost:15.50];

    //Dominos
    Pizzeria *dom1 = [[Pizzeria alloc]initWith: 5 andCost:6.99];
    Pizzeria *dom2 = [[Pizzeria alloc]initWith: 6 andCost:8.99];
    Pizzeria *dom3 = [[Pizzeria alloc]initWith:7 andCost:10.99];
//    Pizzeria *dom4 = [[Pizzeria alloc]initWith:@"extra large $12.99" andSizeInt:8 andCost:12.99 andName:@"Domino's"];

    //Giordano's
    Pizzeria *gior1 = [[Pizzeria alloc]initWith: 5 andCost:15.50];
    Pizzeria *gior2 = [[Pizzeria alloc]initWith: 6 andCost:20.25];
    Pizzeria *gior3 = [[Pizzeria alloc]initWith: 7 andCost:15.50];

    //piece
    Pizzeria *piece1 = [[Pizzeria alloc]initWith:5 andCost:12.49];
    Pizzeria *piece2 = [[Pizzeria alloc]initWith:6 andCost:15.49];
    Pizzeria *piece3 = [[Pizzeria alloc]initWith:7 andCost:18.49];

    //Gino's
    Pizzeria *gino1 = [[Pizzeria alloc]initWith:5 andCost:24.0];
    Pizzeria *gino2 = [[Pizzeria alloc]initWith:6 andCost:30.0];
    Pizzeria *gino3 = [[Pizzeria alloc]initWith:7 andCost:34.0];

    //Quatinos
    Pizzeria *quar1 = [[Pizzeria alloc]initWith: 5 andCost:10.0];
    
  //Santullos
    Pizzeria *santu1 = [[Pizzeria alloc]initWith: 10 andCost:28.0];
//    Pizzeria *flou2 = [[Pizzeria alloc]initWith: 7 andCost:16.0];
//    Pizzeria *flou3 = [[Pizzeria alloc]initWith: 8 andCost:18.0];

    //Dimo's- pizza by the slice tons of variety
    Pizzeria *dimos1 = [[Pizzeria alloc]initWith: 6 andCost:9.0];
    Pizzeria *dimos2 = [[Pizzeria alloc]initWith: 10 andCost:16.0];
//    Pizzeria *lou3 = [[Pizzeria alloc]initWith: 8 andCost:15.50];

  //crocadile slices $3
   // Pizzeria *crocs = [[Pizzeria alloc]initWith: 6 andCost:9.50];
//    Pizzeria *lou2 = [[Pizzeria alloc]initWith: 7 andCost:12.50];
//    Pizzeria *lou3 = [[Pizzeria alloc]initWith: 8 andCost:15.50];

    //Craft
    Pizzeria *craft1 = [[Pizzeria alloc]initWith: 7 andCost:13.0];
    Pizzeria *craft2 = [[Pizzeria alloc]initWith: 9 andCost:17.0];

//Toppers
    Pizzeria *topp1 = [[Pizzeria alloc]initWith: 6 andCost:13.99];
    Pizzeria *topp2 = [[Pizzeria alloc]initWith: 7 andCost:15.99];
    Pizzeria *topp3 = [[Pizzeria alloc]initWith: 8 andCost:17.99];

 //Flo and Santos
    Pizzeria *flo1 = [[Pizzeria alloc]initWith: 6 andCost:13.0];
    Pizzeria *flo2 = [[Pizzeria alloc]initWith: 7 andCost:16.0];
    Pizzeria *flo3 = [[Pizzeria alloc]initWith: 8 andCost:18.0];

//Pequods
    Pizzeria *pequ1 = [[Pizzeria alloc]initWith: 5 andCost:11.75];
    Pizzeria *pequ2 = [[Pizzeria alloc]initWith: 6 andCost:15.50];
    Pizzeria *pequ3 = [[Pizzeria alloc]initWith: 7 andCost:18.75];
//My Pi //deep dish, they also have thin
    Pizzeria *myPi1 = [[Pizzeria alloc]initWith: 6 andCost:12.50];
    Pizzeria *myPi2 = [[Pizzeria alloc]initWith: 7 andCost:16.75];
    Pizzeria *myPi3 = [[Pizzeria alloc]initWith: 8 andCost:19.50];
    //Lou's
    Pizzeria *pizano1 = [[Pizzeria alloc]initWith: 5 andCost:15.70];
    Pizzeria *pizano2 = [[Pizzeria alloc]initWith: 6 andCost:20.45];
    Pizzeria *pizano3 = [[Pizzeria alloc]initWith: 7 andCost:22.45];
//    //Osteria La Madia-- bunch of pizza's but all one size and price
//Pizzeria Uno, unconfirmed radiu'
    Pizzeria *uno1 = [[Pizzeria alloc]initWith: 5 andCost:12.99];
    Pizzeria *uno2 = [[Pizzeria alloc]initWith: 6 andCost:17.49];
    Pizzeria *uno3 = [[Pizzeria alloc]initWith: 7 andCost:22.79];
//    Bongiorno's Italian deli and pizza- one size bunch of differnt pizzas
    //bella bacinos
    Pizzeria *bella1 = [[Pizzeria alloc]initWith: 5 andCost:9.35];
    Pizzeria *bella2 = [[Pizzeria alloc]initWith: 6 andCost:12.95];
    Pizzeria *bella3 = [[Pizzeria alloc]initWith: 7 andCost:17.50];
//    Pizzeria *bella4 = [[Pizzeria alloc]initWith: 8 andCost:21.50];

//Pizzeria Ora
    Pizzeria *ora1 = [[Pizzeria alloc]initWith: 4.5 andCost:10.50];
    Pizzeria *ora2 = [[Pizzeria alloc]initWith: 6 andCost:14.55];
    Pizzeria *ora3 = [[Pizzeria alloc]initWith: 7 andCost:18.75];
//Vapiano one size
//Tesori - one size upscale italian
//Sbarro- no data online
//Blaze fast fired pizza- one size quick casual
//Beggars Pizza
    Pizzeria *beggars1 = [[Pizzeria alloc]initWith: 5 andCost:13.50];
    Pizzeria *beggars2 = [[Pizzeria alloc]initWith: 6 andCost:17.75];
    Pizzeria *beggars3 = [[Pizzeria alloc]initWith: 7 andCost:22.50];
//Sarpino's
    Pizzeria *sarp1 = [[Pizzeria alloc]initWith: 5 andCost:10.99];
    Pizzeria *sarp2 = [[Pizzeria alloc]initWith: 6 andCost:13.99];
    Pizzeria *sarp3 = [[Pizzeria alloc]initWith: 7 andCost:15.99];
//    Pizzeria *sarp4 = [[Pizzeria alloc]initWith: 8 andCost:17.99];
//Venice Cafe one size
//Bacci- hand tossed NY style
    Pizzeria *bacci1 = [[Pizzeria alloc]initWith: 7 andCost:14.95];
    Pizzeria *bacci2 = [[Pizzeria alloc]initWith: 9 andCost:19.95];
    Pizzeria *bacci3 = [[Pizzeria alloc]initWith: 12 andCost:27.95];
//Pat's
    Pizzeria *pats1 = [[Pizzeria alloc]initWith: 6 andCost:12.25];
    Pizzeria *pats2 = [[Pizzeria alloc]initWith: 7 andCost:14.50];
    Pizzeria *pats3 = [[Pizzeria alloc]initWith: 8 andCost:17.00];
//Old fifth
    Pizzeria *old51 = [[Pizzeria alloc]initWith: 7 andCost:18.00];
    Pizzeria *old52= [[Pizzeria alloc]initWith: 8 andCost:23.00];
    //Pizzeria *sarp3 = [[Pizzeria alloc]initWith: 7 andCost:15.99];
//old town pub thin
    Pizzeria *otp1 = [[Pizzeria alloc]initWith: 6 andCost:8.00];
    Pizzeria *otp2 = [[Pizzeria alloc]initWith: 7 andCost:12.00];
    Pizzeria *otp3 = [[Pizzeria alloc]initWith: 8 andCost:15.00];
//5 bouroughs
    Pizzeria *fivebur1 = [[Pizzeria alloc]initWith: 5 andCost:7.99];
    Pizzeria *fivebur2 = [[Pizzeria alloc]initWith: 6 andCost:10.99];
    Pizzeria *fivebur3 = [[Pizzeria alloc]initWith: 7 andCost:13.49];
    //Pizzeria *fivebur4 = [[Pizzeria alloc]initWith: 9 andCost:18.49];
//downtown pizza
    Pizzeria *dtown1 = [[Pizzeria alloc]initWith: 5 andCost:13.95];
    Pizzeria *dtown2 = [[Pizzeria alloc]initWith: 6 andCost:16.95];
    //Pizzeria *3 = [[Pizzeria alloc]initWith: 7 andCost:15.99];
//pizza and oven grinder
    Pizzeria *grind1 = [[Pizzeria alloc]initWith: 4 andCost:11.75];
    Pizzeria *grind2 = [[Pizzeria alloc]initWith: 5 andCost:23.50];
//    Pizzeria *sarp3 = [[Pizzeria alloc]initWith: 7 andCost:15.99];
//the art of pizza
    Pizzeria *art1 = [[Pizzeria alloc]initWith: 5 andCost:14.75];
    Pizzeria *art2 = [[Pizzeria alloc]initWith: 6 andCost:18.75];
    Pizzeria *art3 = [[Pizzeria alloc]initWith: 7 andCost:22.25];

    //Pizzeria's in views
    if ([self.pizzaPlace.name containsString:@"The Art of Pizza"]) {
        self.imageView.image = [UIImage imageNamed:@"artOfPizzaImage"];
        Pizzeria *firstPizza = art1;
        Pizzeria *secondPizza = art2;
        Pizzeria *thirdPizza = art3;

        double firstCost = firstPizza.costOfPie;
        double secondCost = secondPizza.costOfPie;
        double thirdCost = thirdPizza.costOfPie;
        double firstRadius = firstPizza.intRadius;
        double secondRadius = secondPizza.intRadius;
        double thirdRadius = thirdPizza.intRadius;

        self.labelTwo.text = [NSString stringWithFormat:@"$%0.2f", firstCost];
        self.labelThree.text = [firstPizza pricePerInch:firstRadius andCost:firstCost];

        self.labelFive.text = [NSString stringWithFormat:@"$%0.2f", secondCost];
        self.labelSix.text = [secondPizza pricePerInch:secondRadius andCost:secondCost];
        double quotient = [secondPizza percentLgOverSmDigit:firstCost andTwo:secondCost];
        self.labelSeven.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient * 100];

        self.labelNine.text = [NSString stringWithFormat:@"$%0.2f", thirdCost];
        self.labelTen.text = [thirdPizza pricePerInch:thirdRadius andCost:thirdCost];
        double quotient1 = [thirdPizza percentLgOverSmDigit:secondCost andTwo:thirdCost];
        double quotient2 = [thirdPizza percentLgOverSmDigit:firstCost andTwo:thirdCost];
        self.labelEleven.text = [NSString stringWithFormat:@"%0.1f%% > med", quotient1 * 100];
        self.labelTwelve.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient2 * 100];

    } else if ([self.pizzaPlace.name containsString:@"Chicago Pizza And Oven Grinder"]) {
        self.imageView.image = [UIImage imageNamed:@"chicagoOven"];
        Pizzeria *firstPizza = grind1;
        Pizzeria *secondPizza = grind2;
        //        Pizzeria *thirdPizza = fivebur3;

        double firstCost = firstPizza.costOfPie;
        double secondCost = secondPizza.costOfPie;
        //      double thirdCost = thirdPizza.costOfPie;
        double firstRadius = firstPizza.intRadius;
        double secondRadius = secondPizza.intRadius;
        //    double thirdRadius = thirdPizza.intRadius;

        self.labelTwo.text = [NSString stringWithFormat:@"$%0.2f", firstCost];
        self.labelThree.text = [firstPizza pricePerInch:firstRadius andCost:firstCost];

        self.labelFive.text = [NSString stringWithFormat:@"$%0.2f", secondCost];
        self.labelSix.text = [secondPizza pricePerInch:secondRadius andCost:secondCost];
        double quotient = [secondPizza percentLgOverSmDigit:firstCost andTwo:secondCost];
        self.labelSeven.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient * 100];

    } else if ([self.pizzaPlace.name containsString:@"Downtown Pizza"]) {
        self.imageView.image = [UIImage imageNamed:@"downtownImage"];
        Pizzeria *firstPizza = dtown1;
        Pizzeria *secondPizza = dtown2;
//        Pizzeria *thirdPizza = fivebur3;

        double firstCost = firstPizza.costOfPie;
        double secondCost = secondPizza.costOfPie;
  //      double thirdCost = thirdPizza.costOfPie;
        double firstRadius = firstPizza.intRadius;
        double secondRadius = secondPizza.intRadius;
    //    double thirdRadius = thirdPizza.intRadius;

        self.labelTwo.text = [NSString stringWithFormat:@"$%0.2f", firstCost];
        self.labelThree.text = [firstPizza pricePerInch:firstRadius andCost:firstCost];

        self.labelFive.text = [NSString stringWithFormat:@"$%0.2f", secondCost];
        self.labelSix.text = [secondPizza pricePerInch:secondRadius andCost:secondCost];
        double quotient = [secondPizza percentLgOverSmDigit:firstCost andTwo:secondCost];
        self.labelSeven.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient * 100];

    } else if ([self.pizzaPlace.name containsString:@"5 Buroughs Pizza"]) {
        self.imageView.image = [UIImage imageNamed:@"5boroughs"];
        Pizzeria *firstPizza = fivebur1;
        Pizzeria *secondPizza = fivebur2;
        Pizzeria *thirdPizza = fivebur3;

        double firstCost = firstPizza.costOfPie;
        double secondCost = secondPizza.costOfPie;
        double thirdCost = thirdPizza.costOfPie;
        double firstRadius = firstPizza.intRadius;
        double secondRadius = secondPizza.intRadius;
        double thirdRadius = thirdPizza.intRadius;

        self.labelTwo.text = [NSString stringWithFormat:@"$%0.2f", firstCost];
        self.labelThree.text = [firstPizza pricePerInch:firstRadius andCost:firstCost];

        self.labelFive.text = [NSString stringWithFormat:@"$%0.2f", secondCost];
        self.labelSix.text = [secondPizza pricePerInch:secondRadius andCost:secondCost];
        double quotient = [secondPizza percentLgOverSmDigit:firstCost andTwo:secondCost];
        self.labelSeven.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient * 100];

        self.labelNine.text = [NSString stringWithFormat:@"$%0.2f", thirdCost];
        self.labelTen.text = [thirdPizza pricePerInch:thirdRadius andCost:thirdCost];
        double quotient1 = [thirdPizza percentLgOverSmDigit:secondCost andTwo:thirdCost];
        double quotient2 = [thirdPizza percentLgOverSmDigit:firstCost andTwo:thirdCost];
        self.labelEleven.text = [NSString stringWithFormat:@"%0.1f%% > med", quotient1 * 100];
        self.labelTwelve.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient2 * 100];

    } else if ([self.pizzaPlace.name containsString:@"Old Town Pub"]) {
        self.imageView.image = [UIImage imageNamed:@"Old Town Pizza Pub"];
        Pizzeria *firstPizza = otp1;
        Pizzeria *secondPizza = otp2;
        Pizzeria *thirdPizza = otp3;

        double firstCost = firstPizza.costOfPie;
        double secondCost = secondPizza.costOfPie;
        double thirdCost = thirdPizza.costOfPie;
        double firstRadius = firstPizza.intRadius;
        double secondRadius = secondPizza.intRadius;
        double thirdRadius = thirdPizza.intRadius;

        self.labelTwo.text = [NSString stringWithFormat:@"$%0.2f", firstCost];
        self.labelThree.text = [firstPizza pricePerInch:firstRadius andCost:firstCost];

        self.labelFive.text = [NSString stringWithFormat:@"$%0.2f", secondCost];
        self.labelSix.text = [secondPizza pricePerInch:secondRadius andCost:secondCost];
        double quotient = [secondPizza percentLgOverSmDigit:firstCost andTwo:secondCost];
        self.labelSeven.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient * 100];

        self.labelNine.text = [NSString stringWithFormat:@"$%0.2f", thirdCost];
        self.labelTen.text = [thirdPizza pricePerInch:thirdRadius andCost:thirdCost];
        double quotient1 = [thirdPizza percentLgOverSmDigit:secondCost andTwo:thirdCost];
        double quotient2 = [thirdPizza percentLgOverSmDigit:firstCost andTwo:thirdCost];
        self.labelEleven.text = [NSString stringWithFormat:@"%0.1f%% > med", quotient1 * 100];
        self.labelTwelve.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient2 * 100];

    } else if ([self.pizzaPlace.name containsString:@"Pat's Pizzeria"]) {
        self.imageView.image = [UIImage imageNamed:@"patsImage"];
        Pizzeria *firstPizza = pats1;
        Pizzeria *secondPizza = pats2;
        Pizzeria *thirdPizza = pats3;

        double firstCost = firstPizza.costOfPie;
        double secondCost = secondPizza.costOfPie;
        double thirdCost = thirdPizza.costOfPie;
        double firstRadius = firstPizza.intRadius;
        double secondRadius = secondPizza.intRadius;
        double thirdRadius = thirdPizza.intRadius;

        self.labelTwo.text = [NSString stringWithFormat:@"$%0.2f", firstCost];
        self.labelThree.text = [firstPizza pricePerInch:firstRadius andCost:firstCost];

        self.labelFive.text = [NSString stringWithFormat:@"$%0.2f", secondCost];
        self.labelSix.text = [secondPizza pricePerInch:secondRadius andCost:secondCost];
        double quotient = [secondPizza percentLgOverSmDigit:firstCost andTwo:secondCost];
        self.labelSeven.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient * 100];

        self.labelNine.text = [NSString stringWithFormat:@"$%0.2f", thirdCost];
        self.labelTen.text = [thirdPizza pricePerInch:thirdRadius andCost:thirdCost];
        double quotient1 = [thirdPizza percentLgOverSmDigit:secondCost andTwo:thirdCost];
        double quotient2 = [thirdPizza percentLgOverSmDigit:firstCost andTwo:thirdCost];
        self.labelEleven.text = [NSString stringWithFormat:@"%0.1f%% > med", quotient1 * 100];
        self.labelTwelve.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient2 * 100];

    } else if ([self.pizzaPlace.name containsString:@"Old Fifth"]) {
        self.imageView.image = [UIImage imageNamed:@"oldfifthImage"];
        Pizzeria *firstPizza = old51;
        Pizzeria *secondPizza = old52;
//        Pizzeria *thirdPizza = bacci3;

        double firstCost = firstPizza.costOfPie;
        double secondCost = secondPizza.costOfPie;
  //      double thirdCost = thirdPizza.costOfPie;
        double firstRadius = firstPizza.intRadius;
        double secondRadius = secondPizza.intRadius;
    //    double thirdRadius = thirdPizza.intRadius;

        self.labelTwo.text = [NSString stringWithFormat:@"$%0.2f", firstCost];
        self.labelThree.text = [firstPizza pricePerInch:firstRadius andCost:firstCost];

        self.labelFive.text = [NSString stringWithFormat:@"$%0.2f", secondCost];
        self.labelSix.text = [secondPizza pricePerInch:secondRadius andCost:secondCost];
        double quotient = [secondPizza percentLgOverSmDigit:firstCost andTwo:secondCost];
        self.labelSeven.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient * 100];

    } else if ([self.pizzaPlace.name containsString:@"Bacci"]) {
        self.imageView.image = [UIImage imageNamed:@"bacciImage"];
        Pizzeria *firstPizza = bacci1;
        Pizzeria *secondPizza = bacci2;
        Pizzeria *thirdPizza = bacci3;

        double firstCost = firstPizza.costOfPie;
        double secondCost = secondPizza.costOfPie;
        double thirdCost = thirdPizza.costOfPie;
        double firstRadius = firstPizza.intRadius;
        double secondRadius = secondPizza.intRadius;
        double thirdRadius = thirdPizza.intRadius;

        self.labelTwo.text = [NSString stringWithFormat:@"$%0.2f", firstCost];
        self.labelThree.text = [firstPizza pricePerInch:firstRadius andCost:firstCost];

        self.labelFive.text = [NSString stringWithFormat:@"$%0.2f", secondCost];
        self.labelSix.text = [secondPizza pricePerInch:secondRadius andCost:secondCost];
        double quotient = [secondPizza percentLgOverSmDigit:firstCost andTwo:secondCost];
        self.labelSeven.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient * 100];

        self.labelNine.text = [NSString stringWithFormat:@"$%0.2f", thirdCost];
        self.labelTen.text = [thirdPizza pricePerInch:thirdRadius andCost:thirdCost];
        double quotient1 = [thirdPizza percentLgOverSmDigit:secondCost andTwo:thirdCost];
        double quotient2 = [thirdPizza percentLgOverSmDigit:firstCost andTwo:thirdCost];
        self.labelEleven.text = [NSString stringWithFormat:@"%0.1f%% > med", quotient1 * 100];
        self.labelTwelve.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient2 * 100];


    } else if ([self.pizzaPlace.name containsString:@"Sarpino's"]) {
        self.imageView.image = [UIImage imageNamed:@"sarpinosImage"];
        Pizzeria *firstPizza = sarp1;
        Pizzeria *secondPizza = sarp2;
        Pizzeria *thirdPizza = sarp3;

        double firstCost = firstPizza.costOfPie;
        double secondCost = secondPizza.costOfPie;
        double thirdCost = thirdPizza.costOfPie;
        double firstRadius = firstPizza.intRadius;
        double secondRadius = secondPizza.intRadius;
        double thirdRadius = thirdPizza.intRadius;

        self.labelTwo.text = [NSString stringWithFormat:@"$%0.2f", firstCost];
        self.labelThree.text = [firstPizza pricePerInch:firstRadius andCost:firstCost];

        self.labelFive.text = [NSString stringWithFormat:@"$%0.2f", secondCost];
        self.labelSix.text = [secondPizza pricePerInch:secondRadius andCost:secondCost];
        double quotient = [secondPizza percentLgOverSmDigit:firstCost andTwo:secondCost];
        self.labelSeven.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient * 100];

        self.labelNine.text = [NSString stringWithFormat:@"$%0.2f", thirdCost];
        self.labelTen.text = [thirdPizza pricePerInch:thirdRadius andCost:thirdCost];
        double quotient1 = [thirdPizza percentLgOverSmDigit:secondCost andTwo:thirdCost];
        double quotient2 = [thirdPizza percentLgOverSmDigit:firstCost andTwo:thirdCost];
        self.labelEleven.text = [NSString stringWithFormat:@"%0.1f%% > med", quotient1 * 100];
        self.labelTwelve.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient2 * 100];

    } else if ([self.pizzaPlace.name containsString:@"Beggars"]) {
        self.imageView.image = [UIImage imageNamed:@"beggarsImage"];
        Pizzeria *firstPizza = beggars1;
        Pizzeria *secondPizza = beggars2;
        Pizzeria *thirdPizza = beggars3;

        double firstCost = firstPizza.costOfPie;
        double secondCost = secondPizza.costOfPie;
        double thirdCost = thirdPizza.costOfPie;
        double firstRadius = firstPizza.intRadius;
        double secondRadius = secondPizza.intRadius;
        double thirdRadius = thirdPizza.intRadius;

        self.labelTwo.text = [NSString stringWithFormat:@"$%0.2f", firstCost];
        self.labelThree.text = [firstPizza pricePerInch:firstRadius andCost:firstCost];

        self.labelFive.text = [NSString stringWithFormat:@"$%0.2f", secondCost];
        self.labelSix.text = [secondPizza pricePerInch:secondRadius andCost:secondCost];
        double quotient = [secondPizza percentLgOverSmDigit:firstCost andTwo:secondCost];
        self.labelSeven.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient * 100];

        self.labelNine.text = [NSString stringWithFormat:@"$%0.2f", thirdCost];
        self.labelTen.text = [thirdPizza pricePerInch:thirdRadius andCost:thirdCost];
        double quotient1 = [thirdPizza percentLgOverSmDigit:secondCost andTwo:thirdCost];
        double quotient2 = [thirdPizza percentLgOverSmDigit:firstCost andTwo:thirdCost];
        self.labelEleven.text = [NSString stringWithFormat:@"%0.1f%% > med", quotient1 * 100];
        self.labelTwelve.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient2 * 100];

    } else if ([self.pizzaPlace.name containsString:@"Pizzeria Ora"]) {
        self.imageView.image = [UIImage imageNamed:@"pizzeriaOra"];
        Pizzeria *firstPizza = ora1;
        Pizzeria *secondPizza = ora2;
        Pizzeria *thirdPizza = ora3;

        double firstCost = firstPizza.costOfPie;
        double secondCost = secondPizza.costOfPie;
        double thirdCost = thirdPizza.costOfPie;
        double firstRadius = firstPizza.intRadius;
        double secondRadius = secondPizza.intRadius;
        double thirdRadius = thirdPizza.intRadius;

        self.labelTwo.text = [NSString stringWithFormat:@"$%0.2f", firstCost];
        self.labelThree.text = [firstPizza pricePerInch:firstRadius andCost:firstCost];

        self.labelFive.text = [NSString stringWithFormat:@"$%0.2f", secondCost];
        self.labelSix.text = [secondPizza pricePerInch:secondRadius andCost:secondCost];
        double quotient = [secondPizza percentLgOverSmDigit:firstCost andTwo:secondCost];
        self.labelSeven.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient * 100];

        self.labelNine.text = [NSString stringWithFormat:@"$%0.2f", thirdCost];
        self.labelTen.text = [thirdPizza pricePerInch:thirdRadius andCost:thirdCost];
        double quotient1 = [thirdPizza percentLgOverSmDigit:secondCost andTwo:thirdCost];
        double quotient2 = [thirdPizza percentLgOverSmDigit:firstCost andTwo:thirdCost];
        self.labelEleven.text = [NSString stringWithFormat:@"%0.1f%% > med", quotient1 * 100];
        self.labelTwelve.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient2 * 100];

    } else if ([self.pizzaPlace.name containsString:@"Pizzeria Ora"]) {
        self.imageView.image = [UIImage imageNamed:@"pizzeriaOra"];
        Pizzeria *firstPizza = ora1;
        Pizzeria *secondPizza = ora2;
        Pizzeria *thirdPizza = ora3;

        double firstCost = firstPizza.costOfPie;
        double secondCost = secondPizza.costOfPie;
        double thirdCost = thirdPizza.costOfPie;
        double firstRadius = firstPizza.intRadius;
        double secondRadius = secondPizza.intRadius;
        double thirdRadius = thirdPizza.intRadius;

        self.labelTwo.text = [NSString stringWithFormat:@"$%0.2f", firstCost];
        self.labelThree.text = [firstPizza pricePerInch:firstRadius andCost:firstCost];

        self.labelFive.text = [NSString stringWithFormat:@"$%0.2f", secondCost];
        self.labelSix.text = [secondPizza pricePerInch:secondRadius andCost:secondCost];
        double quotient = [secondPizza percentLgOverSmDigit:firstCost andTwo:secondCost];
        self.labelSeven.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient * 100];

        self.labelNine.text = [NSString stringWithFormat:@"$%0.2f", thirdCost];
        self.labelTen.text = [thirdPizza pricePerInch:thirdRadius andCost:thirdCost];
        double quotient1 = [thirdPizza percentLgOverSmDigit:secondCost andTwo:thirdCost];
        double quotient2 = [thirdPizza percentLgOverSmDigit:firstCost andTwo:thirdCost];
        self.labelEleven.text = [NSString stringWithFormat:@"%0.1f%% > med", quotient1 * 100];
        self.labelTwelve.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient2 * 100];

    } else if ([self.pizzaPlace.name containsString:@"Bella Bacino"] || [self.pizzaPlace.name containsString:@"Bacino"]) {
        self.imageView.image = [UIImage imageNamed:@"bellaImage"];
        Pizzeria *firstPizza = bella1;
        Pizzeria *secondPizza = bella2;
        Pizzeria *thirdPizza = bella3;

        double firstCost = firstPizza.costOfPie;
        double secondCost = secondPizza.costOfPie;
        double thirdCost = thirdPizza.costOfPie;
        double firstRadius = firstPizza.intRadius;
        double secondRadius = secondPizza.intRadius;
        double thirdRadius = thirdPizza.intRadius;

        self.labelTwo.text = [NSString stringWithFormat:@"$%0.2f", firstCost];
        self.labelThree.text = [firstPizza pricePerInch:firstRadius andCost:firstCost];

        self.labelFive.text = [NSString stringWithFormat:@"$%0.2f", secondCost];
        self.labelSix.text = [secondPizza pricePerInch:secondRadius andCost:secondCost];
        double quotient = [secondPizza percentLgOverSmDigit:firstCost andTwo:secondCost];
        self.labelSeven.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient * 100];

        self.labelNine.text = [NSString stringWithFormat:@"$%0.2f", thirdCost];
        self.labelTen.text = [thirdPizza pricePerInch:thirdRadius andCost:thirdCost];
        double quotient1 = [thirdPizza percentLgOverSmDigit:secondCost andTwo:thirdCost];
        double quotient2 = [thirdPizza percentLgOverSmDigit:firstCost andTwo:thirdCost];
        self.labelEleven.text = [NSString stringWithFormat:@"%0.1f%% > med", quotient1 * 100];
        self.labelTwelve.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient2 * 100];

    } else if ([self.pizzaPlace.name containsString:@"Uno"]) {
        self.imageView.image = [UIImage imageNamed:@"pizzeriaUno"];
        Pizzeria *firstPizza = uno1;
        Pizzeria *secondPizza = uno2;
        Pizzeria *thirdPizza = uno3;

        double firstCost = firstPizza.costOfPie;
        double secondCost = secondPizza.costOfPie;
        double thirdCost = thirdPizza.costOfPie;
        double firstRadius = firstPizza.intRadius;
        double secondRadius = secondPizza.intRadius;
        double thirdRadius = thirdPizza.intRadius;

        self.labelTwo.text = [NSString stringWithFormat:@"$%0.2f", firstCost];
        self.labelThree.text = [firstPizza pricePerInch:firstRadius andCost:firstCost];

        self.labelFive.text = [NSString stringWithFormat:@"$%0.2f", secondCost];
        self.labelSix.text = [secondPizza pricePerInch:secondRadius andCost:secondCost];
        double quotient = [secondPizza percentLgOverSmDigit:firstCost andTwo:secondCost];
        self.labelSeven.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient * 100];

        self.labelNine.text = [NSString stringWithFormat:@"$%0.2f", thirdCost];
        self.labelTen.text = [thirdPizza pricePerInch:thirdRadius andCost:thirdCost];
        double quotient1 = [thirdPizza percentLgOverSmDigit:secondCost andTwo:thirdCost];
        double quotient2 = [thirdPizza percentLgOverSmDigit:firstCost andTwo:thirdCost];
        self.labelEleven.text = [NSString stringWithFormat:@"%0.1f%% > med", quotient1 * 100];
        self.labelTwelve.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient2 * 100];

    } else if ([self.pizzaPlace.name containsString:@"Uno"] || [self.pizzaPlace.name containsString:@"Due"]) {
        self.imageView.image = [UIImage imageNamed:@"pizzeriaUno"];
        Pizzeria *firstPizza = uno1;
        Pizzeria *secondPizza = uno2;
        Pizzeria *thirdPizza = uno3;

        double firstCost = firstPizza.costOfPie;
        double secondCost = secondPizza.costOfPie;
        double thirdCost = thirdPizza.costOfPie;
        double firstRadius = firstPizza.intRadius;
        double secondRadius = secondPizza.intRadius;
        double thirdRadius = thirdPizza.intRadius;

        self.labelTwo.text = [NSString stringWithFormat:@"$%0.2f", firstCost];
        self.labelThree.text = [firstPizza pricePerInch:firstRadius andCost:firstCost];

        self.labelFive.text = [NSString stringWithFormat:@"$%0.2f", secondCost];
        self.labelSix.text = [secondPizza pricePerInch:secondRadius andCost:secondCost];
        double quotient = [secondPizza percentLgOverSmDigit:firstCost andTwo:secondCost];
        self.labelSeven.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient * 100];

        self.labelNine.text = [NSString stringWithFormat:@"$%0.2f", thirdCost];
        self.labelTen.text = [thirdPizza pricePerInch:thirdRadius andCost:thirdCost];
        double quotient1 = [thirdPizza percentLgOverSmDigit:secondCost andTwo:thirdCost];
        double quotient2 = [thirdPizza percentLgOverSmDigit:firstCost andTwo:thirdCost];
        self.labelEleven.text = [NSString stringWithFormat:@"%0.1f%% > med", quotient1 * 100];
        self.labelTwelve.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient2 * 100];

    } else if ([self.pizzaPlace.name containsString:@"Uno"]) {
        self.imageView.image = [UIImage imageNamed:@"pizzeriaUno"];
        Pizzeria *firstPizza = uno1;
        Pizzeria *secondPizza = uno2;
        Pizzeria *thirdPizza = uno3;

        double firstCost = firstPizza.costOfPie;
        double secondCost = secondPizza.costOfPie;
        double thirdCost = thirdPizza.costOfPie;
        double firstRadius = firstPizza.intRadius;
        double secondRadius = secondPizza.intRadius;
        double thirdRadius = thirdPizza.intRadius;

        self.labelTwo.text = [NSString stringWithFormat:@"$%0.2f", firstCost];
        self.labelThree.text = [firstPizza pricePerInch:firstRadius andCost:firstCost];

        self.labelFive.text = [NSString stringWithFormat:@"$%0.2f", secondCost];
        self.labelSix.text = [secondPizza pricePerInch:secondRadius andCost:secondCost];
        double quotient = [secondPizza percentLgOverSmDigit:firstCost andTwo:secondCost];
        self.labelSeven.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient * 100];

        self.labelNine.text = [NSString stringWithFormat:@"$%0.2f", thirdCost];
        self.labelTen.text = [thirdPizza pricePerInch:thirdRadius andCost:thirdCost];
        double quotient1 = [thirdPizza percentLgOverSmDigit:secondCost andTwo:thirdCost];
        double quotient2 = [thirdPizza percentLgOverSmDigit:firstCost andTwo:thirdCost];
        self.labelEleven.text = [NSString stringWithFormat:@"%0.1f%% > med", quotient1 * 100];
        self.labelTwelve.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient2 * 100];

    } else if ([self.pizzaPlace.name containsString:@"Pizano's"] || [self.pizzaPlace.name containsString:@"Pizzano's"]) {
        self.imageView.image = [UIImage imageNamed:@"pizanosImage"];
        Pizzeria *firstPizza = pizano1;
        Pizzeria *secondPizza = pizano2;
        Pizzeria *thirdPizza = pizano3;

        double firstCost = firstPizza.costOfPie;
        double secondCost = secondPizza.costOfPie;
        double thirdCost = thirdPizza.costOfPie;
        double firstRadius = firstPizza.intRadius;
        double secondRadius = secondPizza.intRadius;
        double thirdRadius = thirdPizza.intRadius;

        self.labelTwo.text = [NSString stringWithFormat:@"$%0.2f", firstCost];
        self.labelThree.text = [firstPizza pricePerInch:firstRadius andCost:firstCost];

        self.labelFive.text = [NSString stringWithFormat:@"$%0.2f", secondCost];
        self.labelSix.text = [secondPizza pricePerInch:secondRadius andCost:secondCost];
        double quotient = [secondPizza percentLgOverSmDigit:firstCost andTwo:secondCost];
        self.labelSeven.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient * 100];

        self.labelNine.text = [NSString stringWithFormat:@"$%0.2f", thirdCost];
        self.labelTen.text = [thirdPizza pricePerInch:thirdRadius andCost:thirdCost];
        double quotient1 = [thirdPizza percentLgOverSmDigit:secondCost andTwo:thirdCost];
        double quotient2 = [thirdPizza percentLgOverSmDigit:firstCost andTwo:thirdCost];
        self.labelEleven.text = [NSString stringWithFormat:@"%0.1f%% > med", quotient1 * 100];
        self.labelTwelve.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient2 * 100];


    } else if ([self.pizzaPlace.name containsString:@"My Pi"]) {
        self.imageView.image = [UIImage imageNamed:@"myPiImage"];
        Pizzeria *firstPizza = myPi1;
        Pizzeria *secondPizza = myPi2;
        Pizzeria *thirdPizza = myPi3;

        double firstCost = firstPizza.costOfPie;
        double secondCost = secondPizza.costOfPie;
        double thirdCost = thirdPizza.costOfPie;
        double firstRadius = firstPizza.intRadius;
        double secondRadius = secondPizza.intRadius;
        double thirdRadius = thirdPizza.intRadius;

        self.labelTwo.text = [NSString stringWithFormat:@"$%0.2f", firstCost];
        self.labelThree.text = [firstPizza pricePerInch:firstRadius andCost:firstCost];

        self.labelFive.text = [NSString stringWithFormat:@"$%0.2f", secondCost];
        self.labelSix.text = [secondPizza pricePerInch:secondRadius andCost:secondCost];
        double quotient = [secondPizza percentLgOverSmDigit:firstCost andTwo:secondCost];
        self.labelSeven.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient * 100];

        self.labelNine.text = [NSString stringWithFormat:@"$%0.2f", thirdCost];
        self.labelTen.text = [thirdPizza pricePerInch:thirdRadius andCost:thirdCost];
        double quotient1 = [thirdPizza percentLgOverSmDigit:secondCost andTwo:thirdCost];
        double quotient2 = [thirdPizza percentLgOverSmDigit:firstCost andTwo:thirdCost];
        self.labelEleven.text = [NSString stringWithFormat:@"%0.1f%% > med", quotient1 * 100];
        self.labelTwelve.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient2 * 100];

    } else if ([self.pizzaPlace.name containsString:@"Pequod's"]) {
        self.imageView.image = [UIImage imageNamed:@"pequodsImage"];
        Pizzeria *firstPizza = pequ1;
        Pizzeria *secondPizza = pequ2;
        Pizzeria *thirdPizza = pequ3;

        double firstCost = firstPizza.costOfPie;
        double secondCost = secondPizza.costOfPie;
        double thirdCost = thirdPizza.costOfPie;
        double firstRadius = firstPizza.intRadius;
        double secondRadius = secondPizza.intRadius;
        double thirdRadius = thirdPizza.intRadius;

        self.labelTwo.text = [NSString stringWithFormat:@"$%0.2f", firstCost];
        self.labelThree.text = [firstPizza pricePerInch:firstRadius andCost:firstCost];

        self.labelFive.text = [NSString stringWithFormat:@"$%0.2f", secondCost];
        self.labelSix.text = [secondPizza pricePerInch:secondRadius andCost:secondCost];
        double quotient = [secondPizza percentLgOverSmDigit:firstCost andTwo:secondCost];
        self.labelSeven.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient * 100];

        self.labelNine.text = [NSString stringWithFormat:@"$%0.2f", thirdCost];
        self.labelTen.text = [thirdPizza pricePerInch:thirdRadius andCost:thirdCost];
        double quotient1 = [thirdPizza percentLgOverSmDigit:secondCost andTwo:thirdCost];
        double quotient2 = [thirdPizza percentLgOverSmDigit:firstCost andTwo:thirdCost];
        self.labelEleven.text = [NSString stringWithFormat:@"%0.1f%% > med", quotient1 * 100];
        self.labelTwelve.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient2 * 100];

    } else if ([self.pizzaPlace.name containsString:@"FloSantos"]) {
        self.imageView.image = [UIImage imageNamed:@"floSantosImage"];
        Pizzeria *firstPizza = flo1;
        Pizzeria *secondPizza = flo2;
        Pizzeria *thirdPizza = flo3;

        double firstCost = firstPizza.costOfPie;
        double secondCost = secondPizza.costOfPie;
        double thirdCost = thirdPizza.costOfPie;
        double firstRadius = firstPizza.intRadius;
        double secondRadius = secondPizza.intRadius;
        double thirdRadius = thirdPizza.intRadius;

        self.labelTwo.text = [NSString stringWithFormat:@"$%0.2f", firstCost];
        self.labelThree.text = [firstPizza pricePerInch:firstRadius andCost:firstCost];

        self.labelFive.text = [NSString stringWithFormat:@"$%0.2f", secondCost];
        self.labelSix.text = [secondPizza pricePerInch:secondRadius andCost:secondCost];
        double quotient = [secondPizza percentLgOverSmDigit:firstCost andTwo:secondCost];
        self.labelSeven.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient * 100];

        self.labelNine.text = [NSString stringWithFormat:@"$%0.2f", thirdCost];
        self.labelTen.text = [thirdPizza pricePerInch:thirdRadius andCost:thirdCost];
        double quotient1 = [thirdPizza percentLgOverSmDigit:secondCost andTwo:thirdCost];
        double quotient2 = [thirdPizza percentLgOverSmDigit:firstCost andTwo:thirdCost];
        self.labelEleven.text = [NSString stringWithFormat:@"%0.1f%% > med", quotient1 * 100];
        self.labelTwelve.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient2 * 100];

    } else if ([self.pizzaPlace.name containsString:@"Toppers"]) {
        self.imageView.image = [UIImage imageNamed:@"toppersImage"];
        Pizzeria *firstPizza = topp1;
        Pizzeria *secondPizza = topp2;
        Pizzeria *thirdPizza = topp3;

        double firstCost = firstPizza.costOfPie;
        double secondCost = secondPizza.costOfPie;
        double thirdCost = thirdPizza.costOfPie;

        double firstRadius = firstPizza.intRadius;
        double secondRadius = secondPizza.intRadius;
        double thirdRadius = thirdPizza.intRadius;

        self.labelTwo.text = [NSString stringWithFormat:@"$%0.2f", firstCost];
        self.labelThree.text = [firstPizza pricePerInch:firstRadius andCost:firstCost];

        self.labelFive.text = [NSString stringWithFormat:@"$%0.2f", secondCost];
        self.labelSix.text = [secondPizza pricePerInch:secondRadius andCost:secondCost];
        double quotient = [secondPizza percentLgOverSmDigit:firstCost andTwo:secondCost];
        self.labelSeven.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient * 100];

        self.labelNine.text = [NSString stringWithFormat:@"$%0.2f", thirdCost];
        self.labelTen.text = [thirdPizza pricePerInch:thirdRadius andCost:thirdCost];
        double quotient1 = [thirdPizza percentLgOverSmDigit:secondCost andTwo:thirdCost];
        double quotient2 = [thirdPizza percentLgOverSmDigit:firstCost andTwo:thirdCost];
        self.labelEleven.text = [NSString stringWithFormat:@"%0.1f%% > med", quotient1 * 100];
        self.labelTwelve.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient2 * 100];

    } else if ([self.pizzaPlace.name containsString:@"Craft"]) {
     self.imageView.image = [UIImage imageNamed:@"craftImage"];
     Pizzeria *firstPizza = craft1;
     Pizzeria *secondPizza = craft2;

        double firstCost = firstPizza.costOfPie;
        double secondCost = secondPizza.costOfPie;
        double firstRadius = firstPizza.intRadius;
        double secondRadius = secondPizza.intRadius;

    self.labelTwo.text = [NSString stringWithFormat:@"$%0.2f", firstCost];
    self.labelThree.text = [firstPizza pricePerInch:firstRadius andCost:firstCost];

    self.labelFive.text = [NSString stringWithFormat:@"$%0.2f", secondCost];
    self.labelSix.text = [secondPizza pricePerInch:secondRadius andCost:secondCost];
    double quotient = [secondPizza percentLgOverSmDigit:firstCost andTwo:secondCost];
    self.labelSeven.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient * 100];

//    self.labelNine.text = [NSString stringWithFormat:@"$%0.2f", thirdCost];
//    self.labelTen.text = [thirdPizza pricePerInch:thirdRadius andCost:thirdCost];
//    double quotient1 = [thirdPizza percentLgOverSmDigit:secondCost andTwo:thirdCost];
//    double quotient2 = [thirdPizza percentLgOverSmDigit:firstCost andTwo:thirdCost];
//    self.labelEleven.text = [NSString stringWithFormat:@"%0.1f%% > med", quotient1 * 100];
//    self.labelTwelve.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient2 * 100];


 } else if ([self.pizzaPlace.name containsString:@"Santullo's"]) {
        self.imageView.image = [UIImage imageNamed:@"floSantosImage"];
        self.labelTwo.text = [NSString stringWithFormat:@"$%0.2f", santu1.costOfPie];
        self.labelThree.text = [santu1 pricePerInch:santu1.intRadius andCost:santu1.costOfPie];

}  else if ([self.pizzaPlace.name containsString:@"Dimo's"]) {
    self.imageView.image = [UIImage imageNamed:@"dimosImage"];
    self.labelTwo.text = [NSString stringWithFormat:@"$%0.2f", dimos1.costOfPie];
    self.labelThree.text = [santu1 pricePerInch:santu1.intRadius andCost:dimos1.costOfPie];

    self.labelFive.text = [NSString stringWithFormat:@"$%0.2f", dimos2.costOfPie];
    self.labelSix.text = [santu1 pricePerInch:santu1.intRadius andCost:santu1.costOfPie];
    double quotient = [santu1 percentLgOverSmDigit:santu1.costOfPie andTwo:santu1.costOfPie];
    self.labelSeven.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient * 100];

} else if ([self.pizzaPlace.name containsString:@"Quartino"]) {
    self.imageView.image = [UIImage imageNamed:@"quartinoImage"];
    self.labelTwo.text = [NSString stringWithFormat:@"$%0.2f", quar1.costOfPie];
    self.labelThree.text = [quar1 pricePerInch:quar1.intRadius andCost:quar1.costOfPie];

    }  else if ([self.pizzaPlace.name containsString:@"Lou"]) {
        self.imageView.image = [UIImage imageNamed:@"slide-pull-1"];
        self.labelTwo.text = [NSString stringWithFormat:@"$%0.2f", lou1.costOfPie];
        self.labelThree.text = [lou1 pricePerInch:lou1.intRadius andCost:lou1.costOfPie];

        self.labelFive.text = [NSString stringWithFormat:@"$%0.2f", lou2.costOfPie];
        self.labelSix.text = [lou2 pricePerInch:lou2.intRadius andCost:lou2.costOfPie];
        double quotient = [lou2 percentLgOverSmDigit:lou1.costOfPie andTwo:lou2.costOfPie];
        self.labelSeven.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient * 100];

        self.labelNine.text = [NSString stringWithFormat:@"$%0.2f", lou3.costOfPie];
        self.labelTen.text = [lou3 pricePerInch:lou3.intRadius andCost:lou3.costOfPie];
        double quotient1 = [lou3 percentLgOverSmDigit:lou2.costOfPie andTwo:lou3.costOfPie];
        double quotient2 = [lou3 percentLgOverSmDigit:lou1.costOfPie andTwo:lou3.costOfPie];
        self.labelEleven.text = [NSString stringWithFormat:@"%0.1f%% > med", quotient1 * 100];
        self.labelTwelve.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient2 * 100];

    } else if ([self.pizzaPlace.name containsString:@"Domino's"])    {

        self.imageView.image = [UIImage imageNamed:@"dominosImage"];
        self.labelTwo.text = [NSString stringWithFormat:@"$%0.2f", dom1.costOfPie];
        self.labelThree.text = [dom1 pricePerInch:dom1.intRadius andCost:dom1.costOfPie];

        self.labelFive.text = [NSString stringWithFormat:@"$%0.2f", dom2.costOfPie];
        self.labelSix.text = [dom2 pricePerInch:dom2.intRadius andCost:dom2.costOfPie];
        double quotient = [dom2 percentLgOverSmDigit:dom1.costOfPie andTwo:dom2.costOfPie];
        self.labelSeven.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient * 100];

        self.labelNine.text = [NSString stringWithFormat:@"$%0.2f", dom3.costOfPie];
        self.labelTen.text = [dom3 pricePerInch:dom3.intRadius andCost:dom3.costOfPie];
        double quotient1 = [dom3 percentLgOverSmDigit:dom2.costOfPie andTwo:dom3.costOfPie];
        double quotient2 = [dom3 percentLgOverSmDigit:dom1.costOfPie andTwo:dom3.costOfPie];
        self.labelEleven.text = [NSString stringWithFormat:@"%0.1f%% > med", quotient1 * 100];
        self.labelTwelve.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient2 * 100];

    }else if ([self.pizzaPlace.name containsString:@"Giodano's"])   {

        self.imageView.image = [UIImage imageNamed:@"giordanosImage"];
        self.labelTwo.text = [NSString stringWithFormat:@"$%0.2f", gior1.costOfPie];
        self.labelThree.text = [gior1 pricePerInch:gior1.intRadius andCost:gior1.costOfPie];

        self.labelFive.text = [NSString stringWithFormat:@"$%0.2f", gior1.costOfPie];
        self.labelSix.text = [gior2 pricePerInch:gior2.intRadius andCost:gior2.costOfPie];
        double quotient = [gior2 percentLgOverSmDigit:gior1.costOfPie andTwo:gior2.costOfPie];
        self.labelSeven.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient * 100];

        self.labelNine.text = [NSString stringWithFormat:@"$%0.2f", gior3.costOfPie];
        self.labelTen.text = [gior3 pricePerInch:gior3.intRadius andCost:gior3.costOfPie];
        double quotient1 = [gior3 percentLgOverSmDigit:gior2.costOfPie andTwo:gior3.costOfPie];
        double quotient2 = [gior3 percentLgOverSmDigit:gior1.costOfPie andTwo:gior3.costOfPie];
        self.labelEleven.text = [NSString stringWithFormat:@"%0.1f%% > med", quotient1 * 100];
        self.labelTwelve.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient2 * 100];

    }else if([self.pizzaPlace.address containsString:@"500 LaSalle"] || [self.pizzaPlace.name containsString:@"Bravo Restaurants"])   {
        self.imageView.image = [UIImage imageNamed:@"ginosImage"];
        self.labelTwo.text = [NSString stringWithFormat:@"$%0.2f", gino1.costOfPie];
        self.labelThree.text = [gino1 pricePerInch:gior1.intRadius andCost:gior1.costOfPie];

        self.labelFive.text = [NSString stringWithFormat:@"$%0.2f", gino1.costOfPie];
        self.labelSix.text = [gino1 pricePerInch:gino1.intRadius andCost:gino1.costOfPie];
        double quotient = [gino2 percentLgOverSmDigit:gino1.costOfPie andTwo:gino2.costOfPie];
        self.labelSeven.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient * 100];

        self.labelNine.text = [NSString stringWithFormat:@"$%0.2f", gino3.costOfPie];
        self.labelTen.text = [gino3 pricePerInch:gino3.intRadius andCost:gino3.costOfPie];
        double quotient1 = [gino3 percentLgOverSmDigit:gino2.costOfPie andTwo:gino3.costOfPie];
        double quotient2 = [gino3 percentLgOverSmDigit:gino1.costOfPie andTwo:gino3.costOfPie];
        self.labelEleven.text = [NSString stringWithFormat:@"%0.1f%% > med", quotient1 * 100];
        self.labelTwelve.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient2 * 100];

    } else if ([self.pizzaPlace.name containsString:@"Piece"])  {
        self.imageView.image = [UIImage imageNamed:@"pieceClam"];
        self.labelTwo.text = [NSString stringWithFormat:@"$%0.2f", piece1.costOfPie];
        self.labelThree.text = [piece1 pricePerInch:piece1.intRadius andCost:piece1.costOfPie];

        self.labelFive.text = [NSString stringWithFormat:@"$%0.2f", piece1.costOfPie];
        self.labelSix.text = [piece1 pricePerInch:piece1.intRadius andCost:piece1.costOfPie];
        double quotient = [piece2 percentLgOverSmDigit:piece1.costOfPie andTwo:piece2.costOfPie];
        self.labelSeven.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient * 100];

        self.labelNine.text = [NSString stringWithFormat:@"$%0.2f", gino3.costOfPie];
        self.labelTen.text = [piece3 pricePerInch:piece3.intRadius andCost:piece3.costOfPie];
        double quotient1 = [piece3 percentLgOverSmDigit:piece2.costOfPie andTwo:piece3.costOfPie];
        double quotient2 = [piece3 percentLgOverSmDigit:piece1.costOfPie andTwo:piece3.costOfPie];
        self.labelEleven.text = [NSString stringWithFormat:@"%0.1f%% > med", quotient1 * 100];
        self.labelTwelve.text = [NSString stringWithFormat:@"%0.1f%% > sm", quotient2 * 100];

    } else {

        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"No Information" message:@"PizzaPi is working hard to add this Pizzeria" preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {

        }];
        [self presentViewController:alert animated:YES completion:nil];
        [alert addAction:action];
    }

    //night/day
    NSDateComponents *component = [[NSCalendar currentCalendar] components:(NSCalendarUnitMonth | NSCalendarUnitHour) fromDate:[NSDate date]];
    NSInteger hours = [component hour];
    NSInteger month = [component month];
    NSInteger eveningHour = 0;

//    NSLog(@"\n\nHOUR IS: %ld", (long)hours);
//    NSLog(@"MONTH IS: %ld", (long)month);

    switch (month) {
        case 12: case 1: case 2:
            // winder shorter days: December, January, February.
            eveningHour = 16;
            break;
        case 3: case 4: case 5:
            // Spring longer day March, April, May.
            eveningHour = 17;
            break;
        case 6: case 7: case 8:
            // summer longest days June, July, August.
            eveningHour = 20;
            break;
        case 9: case 10: case 11:
            // fall shorter days September, October, November.
            eveningHour = 17;
            break;
        default: break;
    }


    if ((hours >= 0) && (hours < 12)) {
        // Morning...
        // Display normal sun icon.
        NSLog(@"Morning");
        self.backgorundImage.image = [UIImage imageNamed:@"large_chicago_on..ect_day"];

    }    else if ((hours >= 12) && (hours < eveningHour)) {
        // Afternoon...
        // Display normal sun icon.
        NSLog(@"Afternoon");
        self.backgorundImage.image = [UIImage imageNamed:@"Chicago_Theater_-_day"];

    }   else if ((hours >= eveningHour) && (hours <= 24)) {
        // Evening/Night...
        NSLog(@"Evening");
        self.backgorundImage.image = [UIImage imageNamed:@"Dark-Chicago"];
        self.midView.backgroundColor = [UIColor blackColor];
        self.midView.alpha = .8;

        UIFont *font = [UIFont boldSystemFontOfSize:12.0f];
        NSDictionary *attributes = [NSDictionary dictionaryWithObject:font
                                                               forKey:NSFontAttributeName];
        [self.segControl setTitleTextAttributes:attributes
                                        forState:UIControlStateNormal];
        self.segControl.tintColor = [UIColor whiteColor];


        self.labelOne.textColor = [UIColor whiteColor];
        self.labelTwo.textColor = [UIColor whiteColor];
        self.labelThree.textColor = [UIColor whiteColor];
        self.labelFour.textColor = [UIColor whiteColor];
        self.labelFive.textColor = [UIColor whiteColor];
        self.labelSix.textColor = [UIColor whiteColor];
        self.labelSeven.textColor = [UIColor whiteColor];
        self.labelEight.textColor = [UIColor whiteColor];
        self.labelNine.textColor = [UIColor whiteColor];
        self.labelTen.textColor = [UIColor whiteColor];
        self.labelEleven.textColor = [UIColor whiteColor];
        self.labelTwelve.textColor = [UIColor whiteColor];

        }
    }



#pragma mark -- Segue Methods



-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if (self.pizzaPlace.url) {
        return YES;
    } else{
        return NO;
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    WebViewController *wvc = segue.destinationViewController;
    wvc.url = self.pizzaPlace.url;
    wvc.pizzeria = self.pizzaPlace.name;
}


- (IBAction)segmentControlChange:(UISegmentedControl *)sender {

    [self.textView reloadInputViews];

    if (self.segControl.selectedSegmentIndex == 1) {
        [self getPathDirectionsBiking:self.currentLocation.coordinate withDestination:self.pizzaPlace.mapItem.placemark.location.coordinate];

    }else if(self.segControl.selectedSegmentIndex == 2){
        [self getPathDirectionsDriving:self.currentLocation.coordinate withDestination:self.pizzaPlace.mapItem.placemark.location.coordinate];
    }
}

- (IBAction)onCallButtonTapped:(UIButton *)sender {

    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.phoneNumberForDialing]];
    //[self.callButton setTitle:self.phoneStrig forState:UIControlStateNormal];
}



#pragma mark -- helper methods

-(void)getPathDirectionsWalking:(CLLocationCoordinate2D)source withDestination:(CLLocationCoordinate2D)destination {
    //source and destination objects init
    MKPlacemark *placemarkSource = [[MKPlacemark alloc]initWithCoordinate:source addressDictionary:nil];
    MKMapItem *mapItemSource = [[MKMapItem alloc]initWithPlacemark:placemarkSource];
    MKPlacemark *placemarkDestination = [[MKPlacemark alloc]initWithCoordinate:destination addressDictionary:nil];
    MKMapItem *mapItemDestination = [[MKMapItem alloc]initWithPlacemark:placemarkDestination];

    MKDirectionsRequest *request = [[MKDirectionsRequest alloc]init];
    [request setSource:mapItemSource];
    [request setDestination:mapItemDestination];
    [request setTransportType:MKDirectionsTransportTypeWalking];
    request.requestsAlternateRoutes = NO;

    MKDirections *directions = [[MKDirections alloc]initWithRequest:request];
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {

        MKRoute *route = response.routes.lastObject;
        NSString *allSteps = [NSString new];

        for (MKRouteStep *eachStep in route.steps) {
            NSString *newStep = eachStep.instructions;
            allSteps = [allSteps stringByAppendingString:newStep];
            allSteps = [allSteps stringByAppendingString:@"\n\n"];
        }
        self.textView.text = allSteps;
    }];
}

-(void)getPathDirectionsBiking:(CLLocationCoordinate2D)source withDestination:(CLLocationCoordinate2D)destination {
    //source and destination objects init
    MKPlacemark *placemarkSource = [[MKPlacemark alloc]initWithCoordinate:source addressDictionary:nil];
    MKMapItem *mapItemSource = [[MKMapItem alloc]initWithPlacemark:placemarkSource];
    MKPlacemark *placemarkDestination = [[MKPlacemark alloc]initWithCoordinate:destination addressDictionary:nil];
    MKMapItem *mapItemDestination = [[MKMapItem alloc]initWithPlacemark:placemarkDestination];

    MKDirectionsRequest *request = [[MKDirectionsRequest alloc]init];
    [request setSource:mapItemSource];
    [request setDestination:mapItemDestination];
    [request setTransportType:MKDirectionsTransportTypeAny];
    request.requestsAlternateRoutes = NO;

    MKDirections *directions = [[MKDirections alloc]initWithRequest:request];
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {

        MKRoute *route = response.routes.lastObject;
        NSString *allSteps = [NSString new];

        for (MKRouteStep *eachStep in route.steps) {
            NSString *newStep = eachStep.instructions;
            allSteps = [allSteps stringByAppendingString:newStep];
            allSteps = [allSteps stringByAppendingString:@"\n\n"];
        }
        self.textView.text = allSteps;
    }];
}


-(void)getPathDirectionsDriving:(CLLocationCoordinate2D)source withDestination:(CLLocationCoordinate2D)destination {
    //source and destination objects init
    MKPlacemark *placemarkSource = [[MKPlacemark alloc]initWithCoordinate:source addressDictionary:nil];
    MKMapItem *mapItemSource = [[MKMapItem alloc]initWithPlacemark:placemarkSource];
    MKPlacemark *placemarkDestination = [[MKPlacemark alloc]initWithCoordinate:destination addressDictionary:nil];
    MKMapItem *mapItemDestination = [[MKMapItem alloc]initWithPlacemark:placemarkDestination];

    MKDirectionsRequest *request = [[MKDirectionsRequest alloc]init];
    [request setSource:mapItemSource];
    [request setDestination:mapItemDestination];
    [request setTransportType:MKDirectionsTransportTypeAutomobile];
    request.requestsAlternateRoutes = NO;

    MKDirections *directions = [[MKDirections alloc]initWithRequest:request];
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {

        MKRoute *route = response.routes.lastObject;
        NSString *allSteps = [NSString new];

        for (MKRouteStep *eachStep in route.steps) {
            NSString *newStep = eachStep.instructions;
            allSteps = [allSteps stringByAppendingString:newStep];
            allSteps = [allSteps stringByAppendingString:@"\n\n"];
        }
        self.textView.text = allSteps;
    }];
}




@end









