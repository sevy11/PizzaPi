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

@interface DetailViewController ()

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

@property (weak, nonatomic) IBOutlet UIButton *callButton;


@property (weak, nonatomic) IBOutlet UITextView *phoneNumberTextView;
@property NSString *phoneNumberForDialing;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property NSMutableArray *detailedPizzeria;

@property NSMutableArray *domArray;
@property NSMutableArray *giorArray;


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //self.collectionView.delegate = self;
    //self.collectionView.backgroundColor = [UIColor yellowColor];

    self.callButton.layer.cornerRadius = 4;
    self.webButton.layer.cornerRadius = 4;

    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationItem.title = self.pizzaPlace.name;
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];


    //phone number displayed
    NSMutableString *oldString = [NSMutableString stringWithString:self.pizzaPlace.phoneNumber];
    NSString *oldestString = [oldString substringFromIndex:2];
    NSMutableString *phoneString = [NSMutableString stringWithString:oldestString];
    self.phoneNumberForDialing = phoneString;
    [phoneString insertString:@"(" atIndex:0];
    [phoneString insertString:@")" atIndex:4];
    [phoneString insertString:@" " atIndex:5];
    [phoneString insertString:@"-" atIndex:9];
    self.pizzaPlace.phoneNumber = phoneString;
    self.phoneNumberTextView.text = phoneString;

    NSString *newString = [NSString stringWithFormat:@"%@", self.pizzaPlace.placemark];
    self.labelOne.text = newString;


    Pizzeria *lou1 = [[Pizzeria alloc]initWith:@"small $9.50" andSizeInt:6 andCost:9.50 andName:@"Lou Malnati's" andImage:[UIImage imageNamed:@"lousImage"]];
    Pizzeria *lou2 = [[Pizzeria alloc]initWith:@"medium $12.50" andSizeInt:7 andCost:12.50 andName:@"Lou Malnati's" andImage:[UIImage imageNamed:@"lousImage"]];
    Pizzeria *lou3 = [[Pizzeria alloc]initWith:@"large $15.50" andSizeInt:8 andCost:15.50 andName:@"Lou Malnati's" andImage:[UIImage imageNamed:@"lousImage"]];

    Pizzeria *dom1 = [[Pizzeria alloc]initWith:@"small $6.99" andSizeInt:5 andCost:6.99 andName:@"Domino's" andImage:[UIImage imageNamed:@"dominosImage"]];
    Pizzeria *dom2 = [[Pizzeria alloc]initWith:@"medium $8.99" andSizeInt:6 andCost:8.99 andName:@"Domino's" andImage:[UIImage imageNamed:@"dominosImage"]];
    Pizzeria *dom3 = [[Pizzeria alloc]initWith:@"large $10.99" andSizeInt:7 andCost:10.99 andName:@"Domino's" andImage:[UIImage imageNamed:@"dominosImage"]];
    Pizzeria *dom4 = [[Pizzeria alloc]initWith:@"extra large $12.99" andSizeInt:8 andCost:12.99 andName:@"Domino's" andImage:[UIImage imageNamed:@"dominosImage"]];

    Pizzeria *gior1 = [[Pizzeria alloc]initWith:@"small $15.50" andSizeInt:5 andCost:15.50 andName:@"Giordano's" andImage:[UIImage imageNamed:@"giodanosImage"]];
    Pizzeria *gior2 = [[Pizzeria alloc]initWith:@"medium $20.25" andSizeInt:6 andCost:20.25 andName:@"Giordano's" andImage:[UIImage imageNamed:@"giodanosImage"]];
    Pizzeria *gior3 = [[Pizzeria alloc]initWith:@"large $25.00" andSizeInt:7 andCost:15.50 andName:@"Giordano's" andImage:[UIImage imageNamed:@"giodanosImage"]];


    self.detailedPizzeria = [NSMutableArray arrayWithObjects:lou1, lou2, lou3, nil];

    self.domArray = [NSMutableArray arrayWithObjects:dom1, dom2, dom3, dom4, nil];
    self.giorArray = [NSMutableArray arrayWithObjects:gior1, gior2, gior3, nil];


    if ([self.pizzaPlace.name containsString:@"Lou"]) {

        double rsquared = lou1.intRadius * lou1.intRadius;
        double rsquared2 = lou2.intRadius * lou2.intRadius;
        double rsquared3 = lou3.intRadius * lou3.intRadius;

        double areaOfZa = M_PI * rsquared;
        double areaOfZa2 = M_PI *rsquared2;
        double areaOfZa3 = M_PI *rsquared3;

        double pricePer = lou1.costOfPie / areaOfZa;
        double pricePer2 = lou2.costOfPie / areaOfZa2;
        double pricePer3 = lou3.costOfPie / areaOfZa3;


        //small
        self.imageView.image = lou1.locationImage;
        self.labelOne.text = lou1.sizeAndCost;
        NSString *newP = [NSString stringWithFormat:@"$%0.3f", pricePer];
        NSString *pricePerString = [NSString stringWithFormat:@"price per square inch: %@", newP];
        self.labelTwo.text = pricePerString;

        //percentage vs. larger size calculations
        double twoMinusOne = pricePer - pricePer2;
        double threeMinusTwo = pricePer2 - pricePer3;
        double threeMinusOne = pricePer - pricePer3;

        double percentage2Vs1 = twoMinusOne / pricePer;
        double percentage3Vs2 = threeMinusTwo / pricePer2;
        double percentage3Vs1 = threeMinusOne / pricePer;

        NSString *stringy = [NSString stringWithFormat:@"%.1f%% better value than a small", percentage2Vs1 *100];
        NSString *stringy2 = [NSString stringWithFormat:@"%.1f%% better value than a medium", percentage3Vs2 *100];
        NSString *stringy3 = [NSString stringWithFormat:@"%.1f%% better value than a small", percentage3Vs1 *100];

        //medium
        self.labelFour.text = lou2.sizeAndCost;
        NSString *newP2 = [NSString stringWithFormat:@"$%0.3f", pricePer2];
        NSString *pricePerString2 = [NSString stringWithFormat:@"price per square inch: %@", newP2];
        self.labelFive.text = pricePerString2;
        self.labelSix.text = stringy;

        //large
        self.labelSeven.text = lou3.sizeAndCost;
        NSString *newP3 = [NSString stringWithFormat:@"$%0.3f", pricePer3];
        NSString *pricePerString3 = [NSString stringWithFormat:@"price per square inch: %@", newP3];
        self.labelEight.text = pricePerString3;
        self.labelNine.text = stringy2;
        self.labelThree.text = stringy3;

    } else if ([self.pizzaPlace.name containsString:@"Giordano"])    {

            double rsquared = gior1.intRadius * gior1.intRadius;
            double rsquared2 = gior2.intRadius * gior2.intRadius;
            double rsquared3 = gior3.intRadius * gior3.intRadius;

            double areaOfZa = M_PI * rsquared;
            double areaOfZa2 = M_PI *rsquared2;
            double areaOfZa3 = M_PI *rsquared3;

            double pricePer = gior1.costOfPie / areaOfZa;
            double pricePer2 = gior2.costOfPie / areaOfZa2;
            double pricePer3 = gior3.costOfPie / areaOfZa3;

            //small
            self.imageView.image = gior1.locationImage;
            self.labelOne.text = gior1.sizeAndCost;
            NSString *newP = [NSString stringWithFormat:@"$%0.3f", pricePer];
            NSString *pricePerString = [NSString stringWithFormat:@"price per square inch: %@", newP];
            self.labelTwo.text = pricePerString;

            //percentage vs. larger size calculations
            double twoMinusOne = pricePer - pricePer2;
            double threeMinusTwo = pricePer2 - pricePer3;
            double threeMinusOne = pricePer - pricePer3;

            double percentage2Vs1 = twoMinusOne / pricePer;
            double percentage3Vs2 = threeMinusTwo / pricePer2;
            double percentage3Vs1 = threeMinusOne / pricePer;

            NSString *stringy = [NSString stringWithFormat:@"%.1f%% better value than a small", percentage2Vs1 *100];
            NSString *stringy2 = [NSString stringWithFormat:@"%.1f%% better value than a medium", percentage3Vs2 *100];
            NSString *stringy3 = [NSString stringWithFormat:@"%.1f%% better value than a small", percentage3Vs1 *100];

            //medium
            self.labelFour.text = gior2.sizeAndCost;
            NSString *newP2 = [NSString stringWithFormat:@"$%0.3f", pricePer2];
            NSString *pricePerString2 = [NSString stringWithFormat:@"price per square inch: %@", newP2];
            self.labelFive.text = pricePerString2;
            self.labelSix.text = stringy;

            //large
            self.labelSeven.text = gior3.sizeAndCost;
            NSString *newP3 = [NSString stringWithFormat:@"$%0.3f", pricePer3];
            NSString *pricePerString3 = [NSString stringWithFormat:@"price per square inch: %@", newP3];
            self.labelEight.text = pricePerString3;
            self.labelNine.text = stringy2;
            self.labelThree.text = stringy3;
        }

}
- (IBAction)onCallButtonTapped:(UIButton *)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.phoneNumberForDialing]];


}



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
    NSLog(@"%@", wvc.pizzeria);
}




@end











//-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
//    return 1;
//}
//
//-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    return self.detailedPizzeria.count;
//}
//
//-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//
//    PizzaCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
//    cell.cellLabelOne.text = self.detailedPizzeria[indexPath.row];
//
//    return cell;
//}










