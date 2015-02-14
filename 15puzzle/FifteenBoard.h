//
//  FifteenBoard.h
//  15puzzle
//
//  Created by Choong Choong Huh Huh on 2/13/15.
//  Copyright (c) 2015 Choong Huh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FifteenBoard : UIView

@property (strong, nonatomic) NSMutableArray *numbers;

-(instancetype)init;

-(void)scramble:(int)n;

-(int)getTileAtRow:(int)row Column:(int)col;

-(void)getRow:(int*)row Column:(int*)col ForTile:(int)tile;

-(BOOL)isSolved;

-(BOOL)canSlideTileUpAtRow:(int)row Column:(int)col;

-(BOOL)canSlideTileDownAtRow:(int)row Column:(int)col;

-(BOOL)canSlideTileLeftAtRow:(int)row Column:(int)col;

-(BOOL)canSlideTileRightAtRow:(int)row Column:(int)col;

-(void)slideTileAtRow:(int)row Column:(int)col;

@end
