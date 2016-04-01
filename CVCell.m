//
//  CVCell.m
//  MariyaCollectionView
//
//  Created by Mariya Eggensperger on 4/1/16.
//  Copyright © 2016 Mariya Eggensperger. All rights reserved.
//

#import "CVCell.h"

@implementation CVCell

@synthesize labelTitle = __titleLabel;

-(id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        NSArray *viewsArray =[[ NSBundle mainBundle ]loadNibNamed:@"CVCell" owner:self options:nil];
        
        if ([viewsArray count] < 1) {
            return nil;
        }
        
        if (![[viewsArray objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]]) {
            return nil;
        }
        
        self = [viewsArray objectAtIndex:0];
        
    }
    
    return self;
    
    }

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
