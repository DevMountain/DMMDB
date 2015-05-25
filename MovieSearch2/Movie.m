//
//  Movie.m
//  MovieSearch2
//
//  Created by Taylor Mott on 22 May 15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (instancetype)initWithDictionary:(NSDictionary *)jsonDictionary
{
    self = [super init];
    
    if (self)
    {
        /*JSON Dictionary should look like this:
        {adult : false
         backdrop_path : "/lGAaaOzqw8nc14HOgSP58TWWo1y.jpg"
         belongs_to_collection : null
         budget : 7000000
         genres : @[...]
         homepage : "http://www.themoviefargo.com/"
         id : 275
         imdb_id : "tt0116282"
         original_language : "en"
         original_title : "Fargo"
         overview : "Jerry, a small-town Minnesota car salesman is bursting at the seams with debt... but he's got a plan. He's going to hire two thugs to kidnap his wife in a scheme to collect a hefty ransom from his wealthy father-in-law. It's going to be a snap and nobody's going to get hurt... until people start dying. Enter Police Chief Marge, a coffee-drinking, parka-wearing - and extremely pregnant - investigator who'll stop at nothing to get her man. And if you think her small-time investigative skills will give the crooks a run for their ransom... you betcha!"
         popularity : 2.577884
         poster_path : "/aZeX4XNSqa08TdMHRB1gDLO6GOi.jpg"
         production_companies : @[...]
         production_countries : @[...]
         release_date : "1996-04-05"
         revenue : 60611975
         runtime : 98
         spoken_languages : @[...]
         status : "Released"
         tagline : "A lot can happen in the middle of nowhere."
         title : "Fargo"
         video : false
         vote_average : 7.4
         vote_count : 502} */
        
        self.title = jsonDictionary[@"title"];
        self.releaseDate = jsonDictionary[@"release_date"];
        self.rating = jsonDictionary[@"vote_average"];
        self.voteCount = jsonDictionary[@"vote_count"];
        self.tagline = jsonDictionary[@"tagline"];
        self.summary = jsonDictionary[@"overview"];
        self.imagePath = jsonDictionary[@"poster_path"];
    }
    
    return self;
}

@end
