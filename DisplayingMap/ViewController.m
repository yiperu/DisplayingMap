//
//  ViewController.m
//  DisplayingMap
//
//  Created by Henry AT on 1/18/16.
//  Copyright © 2016 Apps4s. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@end

@implementation ViewController

@synthesize map01;
@synthesize locationManager;

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  [map01 setDelegate:self];
  [map01 setShowsUserLocation:YES];
  
  /*
   For have in consideration:
   if CLLocationManager.locationServicesEnabled() {
   locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
   locationManager.requestLocation()
   }
   
   
   
   That’s because there’s one more thing left to take care of. You need to provide the user with a reason for your request.
   Open Supporting Files > info.plist and follow these steps:
   Add “NSLocationWhenInUseUsageDescription” as a Key in the Information Property List.
   Keep the Type as String.
   Set the Value with the message to show the user, explaining why you’re asking for their location:
   “Allow us to access your current location so we can autofill your start/end point.”
   
   
   Note: NSLocationWhenInUseUsageDescription | .requestWhenInUseAuthorization() lets the app access the user’s location while the app is being used.
   NSLocationAlwaysUsageDescription | .requestAlwaysAuthorization() lets the app access the user’s location, even while the app is backgrounded.
   */

//  [map01 ];

//  [CLLocationManager requestWhenInUseAuthorization];
//  [CLLocationManager requestAlwaysAuthorization];
  
  
  
    [self.locationManager requestWhenInUseAuthorization]; // or requestAlwaysAuthorization
  
//  if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) { // or requestAlwaysAuthorization
//    [self.locationManager requestWhenInUseAuthorization]; // or requestAlwaysAuthorization
//  }
//  [self.locationManager startUpdatingLocation];
  
  
  locationManager = [[CLLocationManager alloc] init];
  locationManager.delegate = self;
  locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
  if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
    [locationManager requestAlwaysAuthorization];
  }
  [locationManager startUpdatingLocation];
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
  CLLocationCoordinate2D loc = [userLocation coordinate];
  MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 500, 500);
  [self.map01 setRegion:region animated:YES];
}










































@end
