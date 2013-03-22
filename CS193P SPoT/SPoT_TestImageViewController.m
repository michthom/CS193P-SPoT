//
//  SPoT_TestImageViewController.m
//  CS193P SPoT
//
//  Created by Michael Thomson on 21/03/2013.
//  Copyright (c) 2013 Michael Thomson. All rights reserved.
//

#import "SPoT_TestImageViewController.h"

@interface SPoT_TestImageViewController ()

@end

@implementation SPoT_TestImageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.imageURL = [[NSURL alloc] initWithString:@"http://images.apple.com/v/iphone/gallery/a/images/photo_3.jpg"];
}

@end
