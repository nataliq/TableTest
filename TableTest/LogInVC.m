//
//  LogInVC.m
//  TableTest
//
//  Created by Nataliya P. on 2/1/13.
//  Copyright (c) 2013 MMAcademy. All rights reserved.
//

#import "LogInVC.h"
#import "PKRevealController.h"
#import "PlaylistTableVC.h"

@interface LogInVC ()

@end

@implementation LogInVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginAction:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    PlaylistTableVC *playlistTVC = [storyboard instantiateViewControllerWithIdentifier:@"PlaylistTableVC"];
    UIViewController *songDetailVC = [storyboard instantiateViewControllerWithIdentifier:@"SongDetails"];
    PKRevealController *revealController = [PKRevealController revealControllerWithFrontViewController:playlistTVC leftViewController:songDetailVC options:nil];
    [self.navigationController pushViewController:revealController animated:YES];
}
@end
