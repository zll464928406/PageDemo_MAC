//
//  ViewController.m
//  PageDemo_MAC
//
//  Created by sunny on 2017/6/9.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ViewController.h"
#import "PageViewController.h"
#import "Masonry.h"

@interface ViewController ()

@property (nonatomic, strong) PageViewController *pageViewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.pageViewController = [[PageViewController alloc] init];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];

}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
