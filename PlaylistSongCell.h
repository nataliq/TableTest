//
//  PlaylistSongCell.h
//  TableTest
//
//  Created by Nataliya P. on 1/31/13.
//  Copyright (c) 2013 MMAcademy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaylistSongCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *songNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *songScrollView;

@end
