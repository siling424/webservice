//
//  Webservice.h
//  Webservice
//
//  Created by 成雷司 on 16/2/25.
//  Copyright © 2016年 司成雷. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Webservice : NSObject

@property (strong, nonatomic) NSString *body;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *webServiceStr;

- (NSMutableURLRequest *)Body:(NSString *)body Url:(NSString *)url Action:(NSString *)action;

@end
