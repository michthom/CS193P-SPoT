//
//  SPoT_TableViewController.m
//  SPoT
//
//  Created by Michael Thomson on 16/03/2013.
//  Copyright (c) 2013 Michael Thomson. All rights reserved.
//

#import "SPoT_TableViewController.h"
#import "SPoT_ImageViewController.h"
#import "FlickrFetcher.h"
#import "SPoT_FlickrPhoto.h"
#import "SPoT_TableViewCell.h"

@interface SPoT_TableViewController ()

@end

@implementation SPoT_TableViewController

@synthesize photos = _photos;

- (NSArray *)photos
{
    if (! _photos) {
       _photos = [[NSArray alloc] init];
    }
    return _photos;
}

- (void)setPhotos:(NSArray *)photos
{
    _photos = photos;
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender
{
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        if (indexPath) {
            if ([segue.identifier isEqualToString:@"showImage"]) {
                if ([segue.destinationViewController respondsToSelector:@selector(setImageURL:)])
                {
                    NSURL *url = [FlickrFetcher urlForPhoto:self.photos[indexPath.row]
                                                     format:FlickrPhotoFormatLarge];
                    [segue.destinationViewController performSelector:@selector(setImageURL:)
                                                          withObject:url];
                }
            }
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    self.photos = [FlickrFetcher stanfordPhotos];
    NSLog(@"photos consists of: %@", self.photos[0]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

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
        recentCell.titleLabel.text = [self.photos[indexPath.row] valueForKey:FLICKR_PHOTO_TITLE];
        recentCell.descriptionLabel.text = [self.photos[indexPath.row] valueForKey:FLICKR_PHOTO_OWNER];
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
