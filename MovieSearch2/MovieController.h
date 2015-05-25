//
//  MovieController.h
//  MovieSearch2
//
//  Created by Taylor Mott on 22 May 15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieController : NSObject

+ (MovieController *)sharedInstance;

@property (nonatomic, strong) NSArray *resultMovies;

@end
