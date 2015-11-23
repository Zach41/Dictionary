//
//  StringHelper.m
//  DictCmd
//
//  Created by ZachZhang on 15/11/23.
//  Copyright © 2015年 ZachZhang. All rights reserved.
//

#import "TFHpple.h"

#import "StringHelper.h"

@implementation StringHelper

+ (instancetype)sharedHelper {
    static StringHelper *helper;
    
    static dispatch_once_t token;
    
    dispatch_once(&token, ^{
        helper = [[StringHelper alloc] init];
    });
    
    return helper;
}

- (NSArray *)getDefinitions:(NSString *)htmlText {
    NSData *htmlData = [htmlText dataUsingEncoding:NSUTF8StringEncoding];
    
    TFHpple *doc = [[TFHpple alloc] initWithHTMLData:htmlData];
    
    NSArray *elements = [doc searchWithXPathQuery:@"//span[@class='trans']"];
    
    NSMutableArray *trans = [NSMutableArray array];
    
    for (TFHppleElement *e in elements) {
        [trans addObject:e.text];
    }
    
    return trans;
}

@end
