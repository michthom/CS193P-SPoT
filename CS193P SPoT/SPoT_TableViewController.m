//
//  SPoT_TableViewController.m
//  SPoT
//
//  Created by Michael Thomson on 16/03/2013.
//  Copyright (c) 2013 Michael Thomson. All rights reserved.
//

#import "SPoT_TableViewController.h"
#import "FlickrFetcher.h"
#import "SPoT_FlickrPhoto.h"
#import "SPoT_TableViewCell.h"

@interface SPoT_TableViewController ()

@end

@implementation SPoT_TableViewController

- (NSMutableArray *)photos
{
    if (! _photos) {
       _photos = [[NSMutableArray alloc] init];
    }
    return _photos;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showImage"]) {
        if ([sender isKindOfClass:[SPoT_TableViewCell class]]) {
            // FIXME: Copy image data to the properties of the ImageViewController?
        }
    }
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSArray *photoData = [FlickrFetcher stanfordPhotos];
    NSLog(@"photos consists of: %@", photoData[0]);
    
    for (int i=0; i < [photoData count]; i++) {
        SPoT_FlickrPhoto *spotPhoto = [[SPoT_FlickrPhoto alloc] initWithFlickrDictionary:photoData[i]];
        if (spotPhoto) {
            [self.photos addObject:spotPhoto];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.photos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"RecentTableCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if ([cell isKindOfClass:[SPoT_TableViewCell class]]) {
        SPoT_TableViewCell *recentCell = (SPoT_TableViewCell *)cell;
        recentCell.titleLabel.text = [self.photos[indexPath.item] photo_title];
        recentCell.descriptionLabel.text = [self.photos[indexPath.item] photo_description];
    }
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
