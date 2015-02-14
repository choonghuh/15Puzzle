//
//  AppDelegate.h
//  15puzzle
//
//  Created by Choong Choong Huh Huh on 2/13/15.
//  Copyright (c) 2015 Choong Huh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FifteenBoard.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) FifteenBoard *board;


@end

