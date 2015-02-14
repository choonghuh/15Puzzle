//
//  ViewController.m
//  15puzzle
//
//  Created by Choong Choong Huh Huh on 2/13/15.
//  Copyright (c) 2015 Choong Huh. All rights reserved.
//

#import "ViewController.h"
#import "BoardView.h"
#import "AppDelegate.h"
#import "FifteenBoard.h"

@interface ViewController ()

@property(weak,nonatomic) IBOutlet BoardView *boardView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)tileSelected:(UIButton *)sender
{
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    FifteenBoard *board = appDelegate.board;
    
    int row,col;

    [board getRow:&row Column:&col ForTile:(int)sender.tag];
    const CGRect buttonBounds = sender.bounds;
    
/*    [board slideTileAtRow:row Column:col];
    NSLog(@"tileSelected: %d,%d", row,col);
*/
    CGPoint buttonCenter = sender.center;
    BOOL slide = NO;
    if([board canSlideTileUpAtRow:row Column:col])
    {
        slide=YES;
        buttonCenter.y-=buttonBounds.size.height;
    }
    else if([board canSlideTileDownAtRow:row Column:col])
    {
        slide=YES;
        buttonCenter.y+=buttonBounds.size.height;
    }
    else if([board canSlideTileLeftAtRow:row Column:col])
    {
        slide=YES;
        buttonCenter.x-=buttonBounds.size.width;
    }
    else if([board canSlideTileRightAtRow:row Column:col])
    {
        slide=YES;
        buttonCenter.x+=buttonBounds.size.width;
    }
    
    if(slide)
    {
        [board slideTileAtRow:row Column:col];
        [UIView animateWithDuration:0.5 animations:^{sender.center=buttonCenter;}];
        
    }
}

-(IBAction)shuffleTiles:(id)sender
{
    NSLog(@"shuffleTiles");
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    FifteenBoard *board = appDelegate.board;
    [board scramble:150];
    [self.boardView setNeedsLayout];
}

@end
