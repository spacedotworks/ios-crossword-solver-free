//
//  ViewController.m
//  crosswordcontextualsolver
//
//  Created by reuben on 15/6/13.
//  Copyright (c) 2013 space.works. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//@synthesize finds;
//@synthesize patts;



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"test.jpg"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    
//    GADRequest *request = [GADRequest request];
//    request.testDevices = [NSArray arrayWithObjects:
//                           @"FAFAF914-8771-432B-B422-672BD1B823AD",
//                           nil];
    
    // Create a view of the standard size at the top of the screen.
    // Available AdSize constants are explained in GADAdSize.h.
    //bannerView_ = [[GADBannerView alloc] initWithAdSize:kGADAdSizeBanner];
    
    bannerView_ = [[GADBannerView alloc] initWithFrame:CGRectMake(0.0, 150, GAD_SIZE_320x50.width, GAD_SIZE_320x50.height)];
    
    // Specify the ad's "unit identifier". This is your AdMob Publisher ID.
    bannerView_.adUnitID = @"a151be07bdcb69d";
    interstitial_ = [[GADInterstitial alloc] init];
    interstitial_.adUnitID = @"a151be07bdcb69d";
      [interstitial_ loadRequest:[GADRequest request]];
    
    // Let the runtime know which UIViewController to restore after taking
    // the user wherever the ad goes and add it to the view hierarchy.
    bannerView_.rootViewController = self;
    [self.view addSubview:bannerView_];
    
    // Initiate a generic request to load it with an ad.
    [bannerView_ loadRequest:[GADRequest request]];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)findhelp:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Entering clues"
                                                    message:@"You may enter clues as they appear in the puzzle. For clues which have blanks, e.g. Helen of ____, you may use an underscore to represent the blank."
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    //  [alert release];
}



- (IBAction)enter:(id)sender {
    
    NSURL *scriptUrl = [NSURL URLWithString:@"http://www.google.com"];
    NSData *data = [NSData dataWithContentsOfURL:scriptUrl];
    if (data){
        
        
        if([self.find.text isEqualToString:@""]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops"
                                                            message:@"Please enter the clue."
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
        else if([self.patt.text isEqualToString:@""]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops"
                                                            message:@"Please enter the pattern."
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
        else{
            UIDevice *myDevice=[UIDevice currentDevice];
            NSString *UUID = [[myDevice identifierForVendor] UUIDString];
            
            
            NSString *urlStr = [NSString stringWithFormat:@"http://reubenli.net/cgi-bin/crosswordios2.cgi?find=%@&patt=%@&andid=%@",
                                [self.find.text stringByReplacingOccurrencesOfString:@" " withString:@"+"],
                                [self.patt.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],
                                UUID,
                                nil];
            NSURL *url = [NSURL URLWithString:urlStr];
            
            
            
            [self.view endEditing:YES];
            
            [_webView1 loadRequest:[NSURLRequest requestWithURL:url]];
           
            int chance = arc4random()% 4;
            if (chance < 1.1) {
            [interstitial_ presentFromRootViewController:self];
            }
        }
    }
    else { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops"
                                                           message:@"A working network connection is required."
                                                          delegate:nil
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:nil];
        [alert show];}
}


- (IBAction)patthelp:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Entering patterns"
                                                    message:@"If none of the characters are known, the number of letters can be used (e.g. 5 or 6). If some of the letters are known, you can use a combination of numbers and symbols (. or ?) for the remaining unknowns. E.g. R?M?? or R1M2."
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
}



- (IBAction)pattenter:(id)sender {
    
    NSURL *scriptUrl = [NSURL URLWithString:@"http://www.google.com"];
    NSData *data = [NSData dataWithContentsOfURL:scriptUrl];
    if (data){
        
        if([self.find.text isEqualToString:@""]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops"
                                                            message:@"Please enter the clue."
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
        else if([self.patt.text isEqualToString:@""]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops"
                                                            message:@"Please enter the pattern."
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
        else{
            UIDevice *myDevice=[UIDevice currentDevice];
            NSString *UUID = [[myDevice identifierForVendor] UUIDString];
            
            NSString *urlStr = [NSString stringWithFormat:@"http://reubenli.net/cgi-bin/crosswordios2.cgi?find=%@&patt=%@&andid=%@",
                                [self.find.text stringByReplacingOccurrencesOfString:@" " withString:@"+"],
                                [self.patt.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],
                                UUID,
                                nil];
            NSURL *url = [NSURL URLWithString:urlStr];
            
            
            [_webView1 loadRequest:[NSURLRequest requestWithURL:url]];
            int chance = arc4random()% 4;
            if (chance < 1.1) {
                [interstitial_ presentFromRootViewController:self];
            }        }
    }
    else { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops"
                                                           message:@"A working network connection is required."
                                                          delegate:nil
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:nil];
        [alert show];}
    
}



- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.patt) {
        [theTextField resignFirstResponder];
    }
    
    return YES;
}

- (BOOL)textFieldShouldReturn2:(UITextField *)theTextField {
    if (theTextField == self.patt) {
        [theTextField resignFirstResponder];
    }
    
    return YES;
}



@end
