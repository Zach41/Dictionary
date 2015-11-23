//
//  StringHelper.h
//  DictCmd
//
//  Created by ZachZhang on 15/11/23.
//  Copyright © 2015年 ZachZhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringHelper : NSObject

+ (instancetype)sharedHelper;

- (NSArray *)getDefinitions:(NSString *)text;

@end
