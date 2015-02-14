//
//  FifteenBoard.m
//  15puzzle
//
//  Created by Choong Choong Huh Huh on 2/13/15.
//  Copyright (c) 2015 Choong Huh. All rights reserved.
//

#import "FifteenBoard.h"

@implementation FifteenBoard

-(instancetype)init
{
    NSLog(@"init");
    if (self = [super init])
    {
        self.numbers=[[NSMutableArray alloc] initWithCapacity:16];
        for (int i=0; i<15;i++)
        {
            [self.numbers addObject:[NSNumber numberWithInt:i+1]];
        }
        [self.numbers addObject:[NSNumber numberWithInt:0]];
    }
    return self;
}

-(void)scramble:(int)n
{

}

-(int)getTileAtRow:(int)row Column:(int)col
{
    return [[self.numbers objectAtIndex:col+row*4] intValue];
}

-(void)getRow:(int *)row Column:(int *)col ForTile:(int)tile
{
    for(int r=0;r<4;r++)
    {
        for(int c=0;c<4;c++)
        {
            if([[self.numbers objectAtIndex:c+r*4] intValue]==tile)
            {
                *row=r;
                *col=c;
            }
        }
    }
}

-(BOOL)isSolved
{
    for(int i=0;i<15;i++)
    {
        if([[self.numbers objectAtIndex:i] intValue]!=i+1) return false;
    }
    return true;
}

-(BOOL)canSlideTileUpAtRow:(int)row Column:(int)col
{
    if(row==0) return false;
    if([[self.numbers objectAtIndex:col+4*(row-1)] intValue]==0) return true;
    return false;
}

-(bool)canSlideTileDownAtRow:(int)row Column:(int)col
{
    if(row==3) return false;
    if([[self.numbers objectAtIndex:col+4*(row+1)] intValue]==0) return true;
    return false;
}

-(bool)canSlideTileLeftAtRow:(int)row Column:(int)col
{
    if(col==0) return false;
    if([[self.numbers objectAtIndex:(col-1)+4*row] intValue]==0) return true;
    return false;
}

-(BOOL)canSlideTileRightAtRow:(int)row Column:(int)col
{
    if(col==3) return false;
    if([[self.numbers objectAtIndex:(col+1)+4*row] intValue]==0) return true;
    return false;
}



-(void)slideTileAtRow:(int)row Column:(int)col
{
    if ([self canSlideTileUpAtRow:row Column:col])
    {
        [self.numbers replaceObjectAtIndex:col+(row-1)*4 withObject:[self.numbers objectAtIndex: col+row*4]];
        [self.numbers replaceObjectAtIndex:col+row*4 withObject:[NSNumber numberWithInt:0]];
        NSLog(@"Okay tile went up");
    }
    if ([self canSlideTileDownAtRow:row Column:col])
    {
        [self.numbers replaceObjectAtIndex:col+(row+1)*4 withObject:[self.numbers objectAtIndex: col+row*4]];
        [self.numbers replaceObjectAtIndex:col+row*4 withObject:[NSNumber numberWithInt:0]];
        NSLog(@"Okay tile went down");
    }
    if ([self canSlideTileLeftAtRow:row Column:col])
    {
        [self.numbers replaceObjectAtIndex:col-1+row*4 withObject:[self.numbers objectAtIndex: col+row*4]];
        [self.numbers replaceObjectAtIndex:col+row*4 withObject:[NSNumber numberWithInt:0]];
        NSLog(@"Okay tile went left");
    }
    if ([self canSlideTileRightAtRow:row Column:col])
    {
        [self.numbers replaceObjectAtIndex:col+1+row*4 withObject:[self.numbers objectAtIndex: col+row*4]];
        [self.numbers replaceObjectAtIndex:col+row*4 withObject:[NSNumber numberWithInt:0]];
        NSLog(@"Okay tile went right");
    }
    
}

@end
