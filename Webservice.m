//
//  Webservice.m
//  Webservice
//
//  Created by 成雷司 on 16/2/25.
//  Copyright © 2016年 司成雷. All rights reserved.
//

#import "Webservice.h"

@implementation Webservice

- (NSMutableURLRequest *)Body:(NSString *)body Url:(NSString *)url Action:(NSString *)action{
    
    _webServiceStr = [NSString stringWithFormat:
                      @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n"
                      "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:ser=\"http://service.logistics.gazelle.cn.com/\">\r\n"
                      "<soapenv:Header/>\r\n"
                      "<soapenv:Body>\r\n"
                      "%@"
                      "</soapenv:Body>\r\n"
                      "</soapenv:Envelope>",body];//WebService头
    
    //SOAPAction
    NSURL *Url = [NSURL URLWithString:url];
    
    NSMutableURLRequest *TheRequest = [NSMutableURLRequest requestWithURL:Url];
    NSString * MsgLength = [NSString stringWithFormat:@"%ld", (unsigned long)_webServiceStr.length];
    [TheRequest addValue:@"text/xml;charset=UTF-8" forHTTPHeaderField:@"Content-type"];
    [TheRequest addValue:action forHTTPHeaderField:@"SOAPAction"];
    [TheRequest addValue:MsgLength forHTTPHeaderField:@"Content-Length"];
    [TheRequest setHTTPMethod:@"POST"];
    [TheRequest setCachePolicy:NSURLRequestUseProtocolCachePolicy];// 设置缓存策略
    [TheRequest setTimeoutInterval:20]; // 设置超时
    [TheRequest setHTTPBody:[_webServiceStr dataUsingEncoding:NSUTF8StringEncoding]];
    
    return TheRequest;
    
}

@end
