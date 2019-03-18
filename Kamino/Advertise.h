//
//  Advertise.h
//  Kamino
//
//  Created by Echo on 18/03/2019.
//  Copyright © 2019 Echo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Advertise : NSObject <NSURLSessionDelegate>

@property (nonatomic,strong) NSString *apiAccessKey;
@property (nonatomic,strong) NSString *baseUrl;

-(void)getAdWithType:(NSInteger)type deviceId:(NSString*)deviceId completitionHandler:(nonnull void (^)(BOOL success, NSDictionary * _Nullable dictionary))completitionHandler;
-(void)registerAdClickWithAdId:(NSString*)adId deviceId:(NSString*)deviceId completitionHandler:(nonnull void (^)(BOOL success, NSDictionary * _Nullable dictionary))completitionHandler;
-(void)registerAdImpressionWithAdId:(NSString*)adId deviceId:(NSString*)deviceId completitionHandler:(nonnull void (^)(BOOL success, NSDictionary * _Nullable dictionary))completitionHandler;

@end

NS_ASSUME_NONNULL_END
