//
//  WHMovieComingSoonRequest.m
//  MovieFan
//
//  Created by Faye on 2017/4/26.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import "WHMovieComingSoonRequest.h"
#import <AFNetworking/AFNetworking.h>
#import "WHMostRecentMovies.h"
#import <YYKit/NSObject+YYModel.h>

@implementation WHMovieComingSoonRequest

- (void)startRequest:(void (^)(WHMostRecentMovies *))completionBlock
                fail:(void (^)(NSString *))failBlock {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSString *URLString =  @"https://api.douban.com/v2/movie/coming_soon";
    NSDictionary *parameters = @{};
    NSURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET"
                                                                          URLString:URLString
                                                                         parameters:parameters
                                                                              error:nil];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"【URL】: %@/n【Error】: %@", URLString, error);
            if (failBlock) {
                failBlock([error description]);
            }
        } else {
            WHMostRecentMovies *movies = [WHMostRecentMovies modelWithDictionary:responseObject];
            if (completionBlock) {
                completionBlock(movies);
            }
        }
    }];
    [dataTask resume];
}

@end
