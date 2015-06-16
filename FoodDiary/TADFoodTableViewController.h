//
//  TADFoodTableViewController.h
//  FoodDiary
//
//  Created by Andre Maia on 11/01/15.
//  Copyright (c) 2015 Andre Maia. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kTADFoodName @"FoodName"
#define kTADRestaurantName @"RestaurantName"
#define kTADRating @"Rating"
#define kTADLatitude @"Latitude"
#define kTADLongitude @"Longitude"

@interface TADFoodTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *foodArray;

-(void) addFood:(NSDictionary *)newFood;
-(void) saveData:(NSNotification *) notification;
@end
