//
//  Advertise.m
//  Kamino
//
//  Created by Echo on 18/03/2019.
//  Copyright © 2019 Echo. All rights reserved.
//

#import "Advertise.h"
#import "Constants.h"

@implementation Advertise

-(id)initWithBaseUrl:(NSString*)baseUrl andApiAccessKey:(NSString*)apiAccessKey {
    self = [super init];
    if (self) {
        self.baseUrl = baseUrl;
        self.apiAccessKey = apiAccessKey;
    }
    return self;
}

- (void)getAdWithType:(NSInteger)type deviceId:(NSString *)deviceId completitionHandler:(void (^)(BOOL, NSDictionary * _Nullable))completitionHandler {
    NSError *error;
    
    //Configuration
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",self.baseUrl,kGetAd]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    //Header Fields
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request addValue:self.apiAccessKey forHTTPHeaderField:kApiKey];
    
    //Method and Parameters
    NSDictionary *parameters = @{
                                 @"AdType" : [NSNumber numberWithInteger:type],
                                 @"DeviceId" : deviceId,
                                 };
    
    [request setHTTPMethod:@"POST"];
    NSData *postData = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:&error];
    [request setHTTPBody:postData];
    
    //Session Task
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
        if (data != nil) {
            if (statusCode != 200) {
                NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                completitionHandler(NO,responseDict);
            } else {
                NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                completitionHandler(YES,responseDict);
            }
        } else {
            completitionHandler(NO,nil);
        }
    }];
    [postDataTask resume];
}

- (void)registerAdClickWithAdId:(NSString *)adId deviceId:(NSString *)deviceId completitionHandler:(void (^)(BOOL, NSDictionary * _Nullable))completitionHandler {
    NSError *error;
    
    //Configuration
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",self.baseUrl,kRegisterAdClick]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    //Header Fields
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request addValue:self.apiAccessKey forHTTPHeaderField:kApiKey];
    
    //Method and Parameters
    NSDictionary *parameters = @{
                                 @"AdId" : adId,
                                 @"DeviceId" : deviceId,
                                 };
    
    [request setHTTPMethod:@"POST"];
    NSData *postData = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:&error];
    [request setHTTPBody:postData];
    
    //Session Task
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
        if (data != nil) {
            if (statusCode != 200) {
                NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                completitionHandler(NO,responseDict);
            } else {
                NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                completitionHandler(YES,responseDict);
            }
        } else {
            completitionHandler(NO,nil);
        }
    }];
    [postDataTask resume];
}

-(void)registerAdImpressionWithAdId:(NSString *)adId deviceId:(NSString *)deviceId completitionHandler:(void (^)(BOOL, NSDictionary * _Nullable))completitionHandler {
    NSError *error;
    
    //Configuration
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",self.baseUrl,kRegisterAdImpression]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    //Header Fields
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request addValue:self.apiAccessKey forHTTPHeaderField:kApiKey];
    
    //Method and Parameters
    NSDictionary *parameters = @{
                                 @"AdId" : adId,
                                 @"DeviceId" : deviceId,
                                 };
    
    [request setHTTPMethod:@"POST"];
    NSData *postData = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:&error];
    [request setHTTPBody:postData];
    
    //Session Task
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
        if (data != nil) {
            if (statusCode != 200) {
                NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                completitionHandler(NO,responseDict);
            } else {
                NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                completitionHandler(YES,responseDict);
            }
        } else {
            completitionHandler(NO,nil);
        }
    }];
    [postDataTask resume];
}

@end
