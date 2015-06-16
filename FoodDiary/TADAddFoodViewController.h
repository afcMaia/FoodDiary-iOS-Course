//
//  TADAddFoodViewController.h
//  FoodDiary
//
//  Created by Andre Maia on 11/01/15.
//  Copyright (c) 2015 Andre Maia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TADFoodTableViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface TADAddFoodViewController : UIViewController <CLLocationManagerDelegate>

@property (nonatomic, weak) TADFoodTableViewController *foodTableViewController;
@property (weak, nonatomic) IBOutlet UITextField *restaurantTextField;
@property (weak, nonatomic) IBOutlet UITextField *foodTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *ratingControll;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) CLLocationManager *locationManager;

- (IBAction)addFoodButtonPressed:(id)sender;
@end
