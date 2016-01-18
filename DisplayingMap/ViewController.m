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
