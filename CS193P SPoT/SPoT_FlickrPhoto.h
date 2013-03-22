//
//  SPoT_FlickrPhoto.h
//  SPoT
//
//  Created by Michael Thomson on 16/03/2013.
//  Copyright (c) 2013 Michael Thomson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPoT_FlickrPhoto : NSObject

@property (nonatomic, strong) NSString *photo_id;
@property (nonatomic, strong) NSString *photo_title;
@property (nonatomic, strong) NSString *photo_description;
@property (nonatomic, strong) NSArray  *photo_tags;
@property (nonatomic, weak) NSURL *photo_URL;


@property (nonatomic, strong) NSDictionary *flickrDictionary;

// Designated initialiser
- (SPoT_FlickrPhoto *)initWithFlickrDictionary:(NSDictionary *)flickrDictionary;

@end
