//
//  PlaylistSongCell.m
//  TableTest
//
//  Created by Nataliya P. on 1/31/13.
//  Copyright (c) 2013 MMAcademy. All rights reserved.
//

#import "PlaylistSongCell.h"

#import <QuartzCore/QuartzCore.h>

@implementation PlaylistSongCell


- (void)setSelected:(BOOL)selected animated:(BOOL)animate
{
    self.accessoryView = selected ? [self makeDetailDisclosureButton] : nil;
    UIColor *shadowColor = selected ? [UIColor colorWithPatternImage:[UIImage imageNamed:@"header.jpg"]] : [UIColor whiteColor];
    
    self.artistLabel.shadowColor = shadowColor;
    self.songNameLabel.shadowColor = shadowColor;
    
    [super setSelected:selected animated:animate];

}

- (UIButton *) makeDetailDisclosureButton
{
    UIButton * accessoryButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [accessoryButton setFrame:CGRectMake(0, 0, 20, 20)];
    [accessoryButton setImage:[UIImage imageNamed:@"current-song-icon.png"] forState:UIControlStateNormal | UIControlStateHighlighted];
    [accessoryButton addTarget: self action: @selector(accessoryButtonTapped:withEvent:) forControlEvents: UIControlEventTouchUpInside];
    
    return ( accessoryButton );
}

- (void) accessoryButtonTapped:(UIControl *)button withEvent:(UIEvent *)event
{
    UITableView *tableView = (UITableView*)[self superview];
    NSIndexPath * indexPath = [tableView indexPathForRowAtPoint: [[[event touchesForView: button] anyObject] locationInView: tableView]];
    if (indexPath)
        [tableView.delegate tableView: tableView accessoryButtonTappedForRowWithIndexPath: indexPath];
}

@end
