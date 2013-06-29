//
//  ViewController.h
//  crosswordcontextualfree
//
//  Created by reuben on 17/6/13.
//  Copyright (c) 2013 space.works. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GADBannerView.h"
#import "GADInterstitial.h"


@interface ViewController : UIViewController <UITextFieldDelegate> {GADBannerView *bannerView_; GADInterstitial *interstitial_;
}
@property (weak, nonatomic) IBOutlet UIWebView *webView1;
@property (weak, nonatomic) IBOutlet UITextField *find;

@property (weak, nonatomic) IBOutlet UITextField *patt;


- (IBAction)findhelp:(id)sender;


- (IBAction)enter:(id)sender;

- (IBAction)patthelp:(id)sender;
- (IBAction)pattenter:(id)sender;

@end

