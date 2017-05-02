//
//  RLMObject+Converter.m
//  MovieFan
//
//  Created by Faye on 2017/5/2.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import "RLMObject+Converter.h"
#import <objc/runtime.h>

@interface RLMObject (Converter_Internal)

// RLMObject private methods
+ (RLMObjectSchema *)sharedSchema;

@end

@implementation RLMObject (Converter)

- (NSDictionary *)convertToJSONDictionary {
    NSArray *schemas = [self defaultPropertys];
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithCapacity:schemas.count];
    for (NSString *objectKeyPath in schemas) {
        id value = [self valueForKeyPath:objectKeyPath];
        Class propertyClass = [self classForPropertyKey:objectKeyPath];
        // RLMArray转换成字典
        if ([propertyClass isSubclassOfClass:([RLMArray class])]) {
            NSMutableArray *array = [NSMutableArray array];
            for (id item in (RLMArray *)value) {
                NSDictionary *itemDict = [item convertToJSONDictionary];
                [array addObject:itemDict];
            }
            value = [array copy];
        }
        // RLMObject转化成字典
        else if ([propertyClass isSubclassOfClass:([RLMObject class])]) {
            value = [value convertToJSONDictionary];
        }
        // 基本类型直接设置
        [result setValue:value forKeyPath:objectKeyPath];
    }
    return result;
}

- (NSArray *)defaultPropertys {
    // 缓存属性列表
    static NSMutableDictionary *mappingForClassName = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mappingForClassName = [NSMutableDictionary dictionary];
    });
    NSArray *mapping = mappingForClassName[NSStringFromClass(self.class)];
    if (!mapping) {
        @synchronized (mappingForClassName) {
            NSMutableArray *result = [NSMutableArray array];
            RLMObjectSchema *schema = [[self class] sharedSchema];
            for (RLMProperty *property in schema.properties) {
                [result addObject:property.name];
            }
            mappingForClassName[NSStringFromClass(self.class)] = result;
            mapping = result;
        }
    }
    return mapping;
}

// 从Attribute里面拿RLMObject的属性类型
- (Class)classForPropertyKey:(NSString *)key {
    const objc_property_t property = class_getProperty([self class], [key UTF8String]);
    if (property) {
        const char *type = property_getAttributes(property);
        // eg. T@"RLMArray<WHRLMMovieSubject>",&,V_subjects
        // eg. T@"WHRLMRanking",&,V_rating
        NSString *attributes = [NSString stringWithUTF8String:type];
        if ([attributes hasPrefix:@"T@"]) {
            static NSCharacterSet *set = nil;
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                set = [NSCharacterSet characterSetWithCharactersInString:@"\"<"];
            });
            @synchronized(set) {
                NSString *string;
                NSScanner *scanner = [NSScanner scannerWithString:attributes];
                scanner.charactersToBeSkipped = set;
                [scanner scanUpToCharactersFromSet:set intoString:NULL];
                [scanner scanUpToCharactersFromSet:set intoString:&string];
                return NSClassFromString(string);
            }
        }
    }
    return nil;
}

@end
