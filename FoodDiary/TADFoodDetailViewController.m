//
//  TADFoodDetailViewController.m
//  FoodDiary
//
//  Created by Andre Maia on 12/01/15.
//  Copyright (c) 2015 Andre Maia. All rights reserved.
//

#import "TADFoodDetailViewController.h"
#import "TADFoodTableViewController.h"

@interface TADFoodDetailViewController ()

@end

@implementation TADFoodDetailViewController
@synthesize food;
@synthesize foodLabel;
@synthesize restaurantLabel;
@synthesize ratingLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [foodLabel setText:[food objectForKey:kTADFoodName]];
    [restaurantLabel setText:[food objectForKey:kTADRestaurantName]];
    
    NSString *foodRating = [food objectForKey:kTADRating];
    NSString *foodRatingSequence = [[NSString alloc] initWithFormat:@"The food is %@", foodRating ];
    
    [ratingLabel setText:foodRatingSequence];
    
    NSNumber *latitude = [food objectForKey:kTADLatitude];
    NSNumber *longitude = [food objectForKey:kTADLongitude];
    
    MKCoordinateRegion region;
    region.span = MKCoordinateSpanMake(0.02, 0.02);
    region.center = CLLocationCoordinate2DMake([latitude floatValue], [longitude floatValue]);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
