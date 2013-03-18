//
//  SPoT_TableViewCell.m
//  SPoT
//
//  Created by Michael Thomson on 16/03/2013.
//  Copyright (c) 2013 Michael Thomson. All rights reserved.
//

#import "SPoT_TableViewCell.h"

@implementation SPoT_TableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
