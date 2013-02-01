//
//  PlaylistTableVC.m
//  TableTest
//
//  Created by Nataliya P. on 1/31/13.
//  Copyright (c) 2013 MMAcademy. All rights reserved.
//

#import "PlaylistTableVC.h"
#import "PlaylistSongCell.h"

@interface PlaylistTableVC ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *optionsBarButtonItem;
@property (strong, nonatomic) NSDictionary *testData;
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation PlaylistTableVC

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
    
    self.testData = [NSDictionary dictionaryWithObjects:@[@[@"Hard", @"Diamonds", @"Love the way you lieeeeeeeeeeeee"], @[@"Fighter", @"Walk Away"]] forKeys:@[@"Rihanna", @"Christina Aguileraaaaaaaaaaaaaaaaaaaaa"]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.testData allKeys].count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr = [self.testData objectForKey: [[self.testData allKeys] objectAtIndex:section]];
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SongCell";
    PlaylistSongCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    NSString *key = [[self.testData allKeys] objectAtIndex:indexPath.section];
    NSArray *arr = [self.testData objectForKey: key];
    
    cell.artistLabel.text = key;
    cell.songNameLabel.text = [arr objectAtIndex:indexPath.row];

    cell.contentView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"table-mini.jpg"]];
    UIView *selectedBackgroundView = [[UIView alloc]init];
    selectedBackgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"current-song.jpg"]];
    cell.selectedBackgroundView = selectedBackgroundView;
   
    cell.artistLabel.highlightedTextColor = [UIColor whiteColor];
    cell.songNameLabel.highlightedTextColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"table-mini.jpg"]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    UIViewController *songDetailVC = [storyboard instantiateViewControllerWithIdentifier:@"SongDetails"];
    [self.navigationController pushViewController:songDetailVC animated:YES];
}

/*
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{    
    PlaylistSongCell *cell = (PlaylistSongCell*)[self.tableView cellForRowAtIndexPath:indexPath];
    
    float width = cell.songNameLabel.frame.origin.x + cell.songNameLabel.frame.size.width;
    [cell.songScrollView setContentSize:CGSizeMake(width, cell.songScrollView.frame.size.height)];
    
    if (width > cell.songScrollView.frame.size.width) {
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1f
                                         target:self
                                       selector:@selector(scrollSongName:)
                                       userInfo:[NSDictionary dictionaryWithObjects:
                                                 @[cell.songScrollView, [NSNumber numberWithFloat:width]] forKeys:
                                                 @[@"scroll view", @"content width"]]
                                        repeats:YES];
    }
}

- (void)scrollSongName:(NSTimer*)sender
{
    UIScrollView *scrollView = [sender.userInfo objectForKey:@"scroll view"];
    float contentWidth = [[sender.userInfo objectForKey:@"content width"] floatValue];
    if( (scrollView.contentOffset.x + scrollView.frame.size.width) < contentWidth )
    {
        //NSLog(@"%f, %f, %f", cell.songScrollView.contentOffset.x , cell.songScrollView.frame.size.width,  cell.songScrollView.contentSize.width);
        [scrollView setContentOffset:CGPointMake(scrollView.contentOffset.x+10, scrollView.contentOffset.y) animated:YES];
    }
    else
    {
        [sender invalidate];
        [scrollView setContentOffset:CGPointMake(0, scrollView.contentOffset.y) animated:YES];
    }
        
}
@end
