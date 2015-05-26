//
//  ESSettingsViewController.m
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 5/26/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import "ESSettingsViewController.h"
#import "NSString+Extensions.h"
#import "ESBaseService.h"

@interface ESSettingsViewController()

@property (weak, nonatomic) IBOutlet UITextField *txtIP;

@end

@implementation ESSettingsViewController

-(void)hasIp {
    if ([self.txtIP.text isValid]) {
        [[ESBaseService sharedInstance] setCommomIP:self.txtIP.text];
    } else {
        [[ESBaseService sharedInstance] setCommomIP:@""];
    }
}
- (IBAction)usarIPButtonPressed:(UIButton *)sender {
//    [self hasIp];
}

@end
