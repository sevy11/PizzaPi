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
    //one size
   // Pizzeria *quar2 = [[Pizzeria alloc]initWith: 7 andCost:12.50];
   // Pizzeria *quar = [[Pizzeria alloc]initWith: 8 andCost:15.50];

    //Volare's
    Pizzeria *vol1 = [[Pizzeria alloc]initWith: 5 andCost:9];
    //one size 
  //  Pizzeria *lou2 = [[Pizzeria alloc]initWith: 7 andCost:12.50];
   // Pizzeria *lou3 = [[Pizzeria alloc]initWith: 8 andCost:15.50];
    
  //Santullos
    Pizzeria *santu1 = [[Pizzeria alloc]initWith: 10 andCost:28.0];
//    Pizzeria *flou2 = [[Pizzeria alloc]initWith: 7 andCost:16.0];
//    Pizzeria *flou3 = [[Pizzeria alloc]initWith: 8 andCost:18.0];
 //Dimo's- pizza by the slice tons of variety
    Pizzeria *dimos1 = [[Pizzeria alloc]initWith: 6 andCost:9.0];
    Pizzeria *dimos2 = [[Pizzeria alloc]initWith: 10 andCost:16.0];
//    Pizzeria *lou3 = [[Pizzeria alloc]initWith: 8 andCost:15.50];

  //crocadile slices $3
    Pizzeria *crocs = [[Pizzeria alloc]initWith: 6 andCost:9.50];
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
//    //Lou's
//    Pizzeria *lou1 = [[Pizzeria alloc]initWith: 6 andCost:9.50];
//    Pizzeria *lou2 = [[Pizzeria alloc]initWith: 7 andCost:12.50];
//    Pizzeria *lou3 = [[Pizzeria alloc]initWith: 8 andCost:15.50];
//    //Lou's
//    Pizzeria *lou1 = [[Pizzeria alloc]initWith: 6 andCost:9.50];
//    Pizzeria *lou2 = [[Pizzeria alloc]initWith: 7 andCost:12.50];
//    Pizzeria *lou3 = [[Pizzeria alloc]initWith: 8 andCost:15.50];
//    //Lou's
//    Pizzeria *lou1 = [[Pizzeria alloc]initWith: 6 andCost:9.50];
//    Pizzeria *lou2 = [[Pizzeria alloc]initWith: 7 andCost:12.50];
//    Pizzeria *lou3 = [[Pizzeria alloc]initWith: 8 andCost:15.50];
//    //Lou's
//    Pizzeria *lou1 = [[Pizzeria alloc]initWith: 6 andCost:9.50];
//    Pizzeria *lou2 = [[Pizzeria alloc]initWith: 7 andCost:12.50];
//    Pizzeria *lou3 = [[Pizzeria alloc]initWith: 8 andCost:15.50];
//    //Lou's
//    Pizzeria *lou1 = [[Pizzeria alloc]initWith: 6 andCost:9.50];
//    Pizzeria *lou2 = [[Pizzeria alloc]initWith: 7 andCost:12.50];
//    Pizzeria *lou3 = [[Pizzeria alloc]initWith: 8 andCost:15.50];
//    //Lou's
//    Pizzeria *lou1 = [[Pizzeria alloc]initWith: 6 andCost:9.50];
//    Pizzeria *lou2 = [[Pizzeria alloc]initWith: 7 andCost:12.50];
//    Pizzeria *lou3 = [[Pizzeria alloc]initWith: 8 andCost:15.50];
//    //Lou's
//    Pizzeria *lou1 = [[Pizzeria alloc]initWith: 6 andCost:9.50];
//    Pizzeria *lou2 = [[Pizzeria alloc]initWith: 7 andCost:12.50];
//    Pizzeria *lou3 = [[Pizzeria alloc]initWith: 8 andCost:15.50];
//    //Lou's
//    Pizzeria *lou1 = [[Pizzeria alloc]initWith: 6 andCost:9.50];
//    Pizzeria *lou2 = [[Pizzeria alloc]initWith: 7 andCost:12.50];
//    Pizzeria *lou3 = [[Pizzeria alloc]initWith: 8 andCost:15.50];

    //*******add pizzerias**********

    if ([self.pizzaPlace.name containsString:@"FloSantos"]) {
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
        self.imageView.image = [UIImage imageNamed:@"craftImage"];
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

    }else if ([self.pizzaPlace.name containsString:@"Craft"]) {
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


 }else if ([self.pizzaPlace.name containsString:@"Santullo's"]) {
        self.imageView.image = [UIImage imageNamed:@"floSantosImage"];
        self.labelTwo.text = [NSString stringWithFormat:@"$%0.2f", santu1.costOfPie];
        self.labelThree.text = [santu1 pricePerInch:santu1.intRadius andCost:santu1.costOfPie];

}  else if ([self.pizzaPlace.name containsString:@"Dimo's"]) {
    self.imageView.image = [UIImage imageNamed:@"dimosImage"];
    self.labelTwo.text = [NSString stringWithFormat:@"$%0.2f", dimos1.costOfPie];
    self.labelThree.text = [dimos1 pricePerInch:lou1.intRadius andCost:dimos1.costOfPie];

    self.labelFive.text = [NSString stringWithFormat:@"$%0.2f", dimos2.costOfPie];
    self.labelSix.text = [dimos2 pricePerInch:dimos2.intRadius andCost:dimos2.costOfPie];
    double quotient = [dimos2 percentLgOverSmDigit:dimos1.costOfPie andTwo:dimos2.costOfPie];
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
        self.labelThree.text = [dom1 pricePerInch:lou1.intRadius andCost:dom1.costOfPie];

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

    }else if([self.pizzaPlace.address containsString:@"500 LaSalle"])   {
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

    } else{

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
    }

    else if ((hours >= 12) && (hours < eveningHour)) {
        // Afternoon...
        // Display normal sun icon.
        NSLog(@"Afternoon");
        self.backgorundImage.image = [UIImage imageNamed:@"Chicago_Theater_-_day"];
    }
    
    else if ((hours >= eveningHour) && (hours <= 24)) {
        // Evening/Night...
        // Display moon icon.
        NSLog(@"Evening");
        self.backgorundImage.image = [UIImage imageNamed:@"Dark-Chicago"];
        self.midView.backgroundColor = [UIColor blackColor];
        self.midView.alpha = .5;

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









