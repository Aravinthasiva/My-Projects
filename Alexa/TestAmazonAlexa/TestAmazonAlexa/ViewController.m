//
//  ViewController.m
//  TestAmazonAlexa
//
//  Created by MacMini3 on 18/09/17.
//  Copyright © 2017 MacMini3. All rights reserved.
//

#import "ViewController.h"
#import "ProvisioningClient.h"

@interface ViewController ()
    @property (strong, nonatomic) NSString *productId;
    @property (strong, nonatomic) NSString *dsn;
    @property (strong, nonatomic) NSString *codeChallenge;
    @property (strong, nonatomic) NSString *authCode;
    @property (strong, nonatomic) ProvisioningClient* deviceProvisionClient;

@end

@implementation ViewController

    //NSString *productId = @"INSERT YOUR PRODUCT ID FROM AMAZON DEVELOPER CONSOLE";
    //NSString *productDsn = @"INSERT UNIQUE DSN FOR YOUR DEVICE";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onLoginButtonClicked:(id)sender {
    
    NSDictionary *scopeData = @{@"productID": self.productId,
                                @"productInstanceAttributes": @{@"deviceSerialNumber": self.dsn}};
    
    id<AMZNScope> alexaAllScope = [AMZNScopeFactory scopeWithName:@"alexa:all" data:scopeData];
    
    AMZNAuthorizeRequest *request = [[AMZNAuthorizeRequest alloc] init];
    request.scopes = @[alexaAllScope];
    request.codeChallenge = self.codeChallenge;
    request.codeChallengeMethod = @"S256";
    request.grantType = AMZNAuthorizationGrantTypeCode;
    
    AMZNAuthorizationManager *authManager = [AMZNAuthorizationManager sharedManager];
    [authManager authorize:request withHandler:^(AMZNAuthorizeResult *result, BOOL userDidCancel, NSError *error) {
        if (error) {
            // Notify the user that authorization failed
            [[[UIAlertView alloc] initWithTitle:@"" message:[NSString stringWithFormat:@"User authorization failed due to an error: %@", error.localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        } else if (userDidCancel) {
            // Notify the user that the authorization was cancelled
            [[[UIAlertView alloc] initWithTitle:@"" message:@"Authorization was cancelled prior to completion. To continue, you will need to try logging in again." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        } else {
            // Fetch the authorization code and return to controller
            self.authCode = result.authorizationCode;
            [self userSuccessfullySignedIn];
        }
    }];
}

-(void) userSuccessfullySignedIn {
    self.loginButton.hidden = YES;
    [self.deviceProvisionClient postCompanionProvisioningInfo: self.deviceAddress.text: self.authCode : self.sessionId];
}


@end
