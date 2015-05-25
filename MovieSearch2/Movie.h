//
//  Movie.h
//  MovieSearch2
//
//  Created by Taylor Mott on 22 May 15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *releaseDate;
@property (strong, nonatomic) NSNumber *rating;
@property (strong, nonatomic) NSNumber *voteCount;
@property (strong, nonatomic) NSString *tagline;
@property (strong, nonatomic) NSString *summary;
@property (strong, nonatomic) NSString *imagePath;

- (instancetype)initWithDictionary:(NSDictionary *)jsonDictionary;

@end
