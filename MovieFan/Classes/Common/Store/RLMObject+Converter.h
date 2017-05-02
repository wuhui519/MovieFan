//
//  RLMObject+Converter.h
//  MovieFan
//
//  Created by Faye on 2017/5/2.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import <Realm/Realm.h>

@interface RLMObject (Converter)

- (NSDictionary *)convertToJSONDictionary;

@end
