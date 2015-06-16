//
//  TADFoodDetailViewController.h
//  FoodDiary
//
//  Created by Andre Maia on 12/01/15.
//  Copyright (c) 2015 Andre Maia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface TADFoodDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *foodLabel;
@property (weak, nonatomic) IBOutlet UILabel *restaurantLabel;

@property (nonatomic, strong) NSDictionary *food;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
