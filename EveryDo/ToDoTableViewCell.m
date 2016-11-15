//
//  ToDoTableViewCell.m
//  EveryDo
//
//  Created by Suvan Ramani on 2016-11-15.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import "ToDoTableViewCell.h"

@interface ToDoTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *todoTiltleLabel;


@end


@implementation ToDoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
