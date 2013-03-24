//
//  ChiShaChoiceManager.h
//  ChiSha
//
//  Created by Shengbin Meng on 13-3-24.
//  Copyright (c) 2013年 Peking University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChiShaChoiceManager : NSObject

+ (void) loadData;
+ (NSMutableArray*) getChoiceList;
+ (void) saveData;
@end
