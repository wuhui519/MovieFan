//
//  WHMovieInThreaterRequest.m
//  MovieFan
//
//  Created by Faye on 2017/4/25.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import "WHMovieInThreaterRequest.h"
#import <AFNetworking/AFNetworking.h>
#import "WHMostRecentMovies.h"
#import <YYKit/NSObject+YYModel.h>

@implementation WHMovieInThreaterRequest

- (void)startRequest:(void (^)(WHMostRecentMovies *))completionBlock
                fail:(void (^)(NSString *))failBlock {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSString *URLString =  @"https://api.douban.com/v2/movie/in_theaters";
    NSDictionary *parameters = @{@"city": @"杭州"};
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
