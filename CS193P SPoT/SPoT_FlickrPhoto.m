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
        
        self.photo_URL = [FlickrFetcher urlForPhoto:flickrDictionary format:FlickrPhotoFormatLarge ];
    }
    return self;
}

//    photos consists of: {
//        accuracy = 16;
//        context = 0;
//        dateupload = 1272309509;
//        description =     {
//            "_content" = "New entrance";
//        };
//        farm = 4;
//        "geo_is_contact" = 0;
//        "geo_is_family" = 0;
//        "geo_is_friend" = 0;
//        "geo_is_public" = 1;
//        id = 4555020571;
//        isfamily = 0;
//        isfriend = 0;
//        ispublic = 1;
//        latitude = "37.426411";
//        longitude = "-122.167276";
//        originalformat = jpg;
//        originalsecret = 18fb4b9338;
//        owner = "48247111@N07";
//        ownername = CS193p;
//        "place_id" = rpQKmnxUV7Ju4VD4wA;
//        secret = 08213fe834;
//        server = 3463;
//        tags = "library cs193pspot";
//        title = "Green Library";
//        woeid = 55860943;
//    }

@end
