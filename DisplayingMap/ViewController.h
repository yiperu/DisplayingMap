//
//  ViewController.h
//  DisplayingMap
//
//  Created by Henry AT on 1/18/16.
//  Copyright © 2016 Apps4s. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *map01;

@property (nonatomic, strong) CLLocationManager * locationManager;

@end

