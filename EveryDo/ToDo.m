//
//  ToDo.m
//  EveryDo
//
//  Created by Suvan Ramani on 2016-11-15.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import "ToDo.h"

@implementation ToDo

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isCompleted = NO;
    }
    return self;
}

@end
