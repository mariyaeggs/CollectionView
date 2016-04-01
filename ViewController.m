//
//  ViewController.m
//  MariyaCollectionView
//
//  Created by Mariya Eggensperger on 4/1/16.
//  Copyright © 2016 Mariya Eggensperger. All rights reserved.
//

#import "ViewController.h"
#import "CVCell.h"

@interface ViewController ()

@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *dataArray; 



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //Data for collection view
    NSMutableArray *sectionOne = [[NSMutableArray alloc]init];
    NSMutableArray *sectionTwo = [[NSMutableArray alloc]init];
    
    for (int i=0; i<50; i++) {
        
        [sectionOne addObject:[NSString stringWithFormat:@"ARTIST %d", i]];
        [sectionTwo addObject:[NSString stringWithFormat:@"ARTIST %d", i]];
    }
    self.dataArray = [[NSArray alloc] initWithObjects:sectionOne, sectionTwo, nil];
    
    //Use subclass CVCell
    [self.collectionView registerClass:[CVCell class] forCellWithReuseIdentifier:@"cvCell"];
    
    //Customize collection view with grid
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setItemSize:CGSizeMake(200, 200)];
    //Scrolls horizontally
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [self.collectionView setCollectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    

}
-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
}
-(BOOL)prefersStatusBarHidden {
    
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
    self.collectionView = nil;
    self.dataArray = nil;
}
//Format collection view
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return [self.dataArray count];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    NSMutableArray *sectionArray = [self.dataArray objectAtIndex:section];
    return [sectionArray count];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //Reuse identifier
    static NSString *reuseIdentifier = @"cvCell";
    
    CVCell *cell = (CVCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSMutableArray *data = [self.dataArray objectAtIndex:indexPath.section];
    NSString *cellData = [data objectAtIndex:indexPath.row];
    [cell.labelTitle setText:cellData];
    
    return cell;

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
