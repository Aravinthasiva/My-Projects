//
//  ViewController.m
//  FragmentDemo
//
//  Created by MacMini3 on 18/05/17.
//  Copyright © 2017 MacMini3. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)actionSegmentControl:(UISegmentedControl *)sender {
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.bookingView.hidden = NO;
            self.myTripView.hidden = YES;
            self.tripsheetView.hidden = YES;
            self.onTravelView.hidden = YES;
            break;
            
        case 1:
            self.bookingView.hidden = YES;
            self.myTripView.hidden = NO;
            self.tripsheetView.hidden = YES;
            self.onTravelView.hidden = YES;
            [_segmentControl setEnabled:NO forSegmentAtIndex:0];
            break;
            
        case 2:
            self.bookingView.hidden = YES;
            self.myTripView.hidden = YES;
            self.tripsheetView.hidden = NO;
            self.onTravelView.hidden = YES;
            break;
            
        case 3:
            self.bookingView.hidden = YES;
            self.myTripView.hidden = YES;
            self.tripsheetView.hidden = YES;
            self.onTravelView.hidden = NO;
            break;
            
        default:
            break;
    }
}
@end
