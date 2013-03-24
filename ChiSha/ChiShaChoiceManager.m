//
//  ChiShaChoiceManager.m
//  ChiSha
//
//  Created by Shengbin Meng on 13-3-24.
//  Copyright (c) 2013年 Peking University. All rights reserved.
//

#import "ChiShaChoiceManager.h"

static NSMutableArray* _choiceList;

@implementation ChiShaChoiceManager

+ (void) loadData
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingFormat:@"/choice-data.plist"];
    _choiceList = [NSMutableArray arrayWithContentsOfFile:filePath];
    if (_choiceList == nil || _choiceList.count == 0) {
        _choiceList = [[NSMutableArray alloc] init];
        NSMutableDictionary *d = [[NSMutableDictionary alloc] init];
        [d setValue:[NSString stringWithFormat:@"农园一层"] forKey:@"name"];
        [_choiceList addObject:d];
        d = [[NSMutableDictionary alloc] init];
        [d setValue:[NSString stringWithFormat:@"燕南"] forKey:@"name"];
        [_choiceList addObject:d];
        d = [[NSMutableDictionary alloc] init];
        [d setValue:[NSString stringWithFormat:@"家园"] forKey:@"name"];
        [_choiceList addObject:d];
        d = [[NSMutableDictionary alloc] init];
        [d setValue:[NSString stringWithFormat:@"艺园"] forKey:@"name"];
        [_choiceList addObject:d];
        d = [[NSMutableDictionary alloc] init];
        [d setValue:[NSString stringWithFormat:@"学一"] forKey:@"name"];
        [_choiceList addObject:d];
        d = [[NSMutableDictionary alloc] init];
        [d setValue:[NSString stringWithFormat:@"学五"] forKey:@"name"];
        [_choiceList addObject:d];
        d = [[NSMutableDictionary alloc] init];
        [d setValue:[NSString stringWithFormat:@"农园二层"] forKey:@"name"];
        [_choiceList addObject:d];
        d = [[NSMutableDictionary alloc] init];
        [d setValue:[NSString stringWithFormat:@"康博斯"] forKey:@"name"];
        [_choiceList addObject:d];
    }
}

+ (NSMutableArray*) getChoiceList
{
    return _choiceList;
}

+ (void) saveData
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingFormat:@"/choice-data.plist"];

    [_choiceList writeToFile:filePath atomically:YES];
}

@end
