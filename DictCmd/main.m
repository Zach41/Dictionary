//
//  main.m
//  DictCmd
//
//  Created by ZachZhang on 15/11/23.
//  Copyright © 2015年 ZachZhang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DictionaryKit.h"
#import "StringHelper.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TTTDictionary *dict = [TTTDictionary dictionaryNamed:DCSSimplifiedChinese_EnglishDictionaryName];
        
        NSString *term = @"default";
        
        if (argc > 1) {
            term = [NSString stringWithCString:argv[1] encoding:NSUTF8StringEncoding];
        } else {
            NSLog(@"term is not given");
        }
        
        if (argc > 2) {
            NSString *dictName = [NSString stringWithCString:argv[2] encoding:NSUTF8StringEncoding];
            
            dict = [TTTDictionary dictionaryNamed:dictName];
        }
        
        NSLog(@"Dictionary Name : %@", dict.name);
        
        NSArray *entries = [dict entriesForSearchTerm:term];
        
        NSString *htmlString = nil;
        
        if(entries.count > 0) {
            htmlString = [entries[0] HTML];
            
            NSArray *results = [[StringHelper sharedHelper] getDefinitions:htmlString];
            
            NSLog(@"%@", results);
        }
        
        
        
    }
    return 0;
}
