//
//  TADAddFoodViewController.m
//  FoodDiary
//
//  Created by Andre Maia on 11/01/15.
//  Copyright (c) 2015 Andre Maia. All rights reserved.
//

#import "TADAddFoodViewController.h"

@interface TADAddFoodViewController ()

@end

@implementation TADAddFoodViewController
@synthesize foodTextField;
@synthesize foodTableViewController;
@synthesize ratingControll;
@synthesize locationLabel;
@synthesize locationManager;
@synthesize activityIndicator;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if (locationManager == nil) {
        locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
        locationManager.purpose = @"The location is used to save the restaurant location.";
    }
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    locationLabel.text = @"Updating Location...";
}

#pragma mark - Location Manager Delegate Methods

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    
    [activityIndicator stopAnimating];
    locationLabel.text = @"Location recieved";
    
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    [activityIndicator stopAnimating];
    locationLabel.text = @"Failed to get Location";
}

- (IBAction)addFoodButtonPressed:(id)sender {
    
    [locationManager stopUpdatingLocation];
    
    NSString *newFoodName = [foodTextField text];
    NSString *newRestaurantName = [foodTextField text];
    NSString *rating = @"Ok";
    
    if ([ratingControll selectedSegmentIndex] == 0) {
        rating = @"good";
    }else if ([ratingControll selectedSegmentIndex] == 1){
        rating = @"bad";
    }
    
    NSNumber *lonNumber = [NSNumber numberWithFloat:0.0];
    NSNumber *latNumber = [NSNumber numberWithFloat:0.0];
    
    if (locationManager.location != nil) {
        CLLocationCoordinate2D  currentCoords = locationManager.location.coordinate;
        lonNumber = [NSNumber numberWithFloat:currentCoords.longitude];
        latNumber = [NSNumber numberWithFloat:currentCoords.longitude];
    }
    
    NSDictionary *newFood = [[NSDictionary alloc] initWithObjectsAndKeys:newFoodName, kTADFoodName, newRestaurantName, kTADRestaurantName, rating, kTADRating, lonNumber, kTADLongitude, latNumber, kTADLatitude, nil];
    [foodTableViewController addFood:newFood];
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}
@end
