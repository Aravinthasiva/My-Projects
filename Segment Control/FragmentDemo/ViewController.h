//
//  ViewController.h
//  FragmentDemo
//
//  Created by MacMini3 on 18/05/17.
//  Copyright © 2017 MacMini3. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *bookingView;
@property (weak, nonatomic) IBOutlet UIView *onTravelView;
@property (weak, nonatomic) IBOutlet UIView *myTripView;
@property (weak, nonatomic) IBOutlet UIView *tripsheetView;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;
- (IBAction)actionSegmentControl:(id)sender;


@end

