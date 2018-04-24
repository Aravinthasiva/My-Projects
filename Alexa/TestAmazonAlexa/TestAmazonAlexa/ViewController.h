//
//  ViewController.h
//  TestAmazonAlexa
//
//  Created by MacMini3 on 18/09/17.
//  Copyright © 2017 MacMini3. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <LoginWithAmazon/LoginWithAmazon.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *loginButton;


- (IBAction)onLoginButtonClicked:(id)sender;


@end

