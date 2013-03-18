//
//  SPoT_FlickrPhoto.m
//  SPoT
//
//  Created by Michael Thomson on 16/03/2013.
//  Copyright (c) 2013 Michael Thomson. All rights reserved.
//

#import "SPoT_FlickrPhoto.h"
#import "FlickrFetcher.h"
@implementation SPoT_FlickrPhoto


- (SPoT_FlickrPhoto *)initWithFlickrDictionary:(NSDictionary *)flickrDictionary;
{
    self = [super init];
    if (self) {
        if ([flickrDictionary valueForKey:FLICKR_PHOTO_ID]) {
            self.photo_id = [flickrDictionary valueForKey:FLICKR_PHOTO_ID];
        } else {
            self.photo_id = @"No ID set";
        }
        
        if ([flickrDictionary valueForKey:FLICKR_PHOTO_TITLE]) {
            self.photo_title = [flickrDictionary valueForKey:FLICKR_PHOTO_TITLE];
        } else {
            self.photo_title = @"No title set";
        }
        
        if ([flickrDictionary valueForKeyPath:FLICKR_PHOTO_DESCRIPTION]) {
            self.photo_description = [flickrDictionary valueForKeyPath:FLICKR_PHOTO_DESCRIPTION];
        } else {
            self.photo_description = @"No description set";
        }
        
        if ([flickrDictionary valueForKeyPath:FLICKR_TAGS]) {
            self.photo_tags = [[flickrDictionary valueForKeyPath:FLICKR_TAGS] componentsSeparatedByString:@" "];
        } else {
            self.photo_tags = @[ @"No tags set" ];
        }
    }
    return self;
}

@end
