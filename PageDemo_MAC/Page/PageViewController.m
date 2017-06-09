//
//  PageViewController.m
//  PageDemo_MAC
//
//  Created by sunny on 2017/6/9.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "PageViewController.h"

@interface PageViewController ()

@end

@implementation PageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self setUpImages];
    /*
     // Setup page control
     NSRect frame = self.leftContentView.frame;
     self.control = [[MXPageControl alloc] init];
     [self.control setDelegate: self];
     [self.control setNumberOfPages: 4];
     [self.control setIndicatorDiameterSize: 15];
     [self.control setIndicatorMargin: 5];
     [self.control setCurrentPage: 0];
     [self.control setDrawingBlock: ^(NSRect frame, NSView *aView, BOOL isSelected, BOOL isHighlighted){
     frame = CGRectInset(frame, 2.0, 2.0);
     NSBezierPath *path = [NSBezierPath bezierPathWithOvalInRect: frame];
     NSColor *color = isSelected ? [NSColor whiteColor] :
     [NSColor colorWithCalibratedRed: (149.0f / 255.0) green: (204.0f / 255.0) blue: (249.0f / 255.0) alpha: 1.0];
     [color set];
     [path fill];
     }];
     [self.leftContentView addSubview:self.control];
     CGSize size = [self.control intrinsicContentSize];
     [self.control setFrame: CGRectMake((frame.size.width - size.width)/2.0f, 15.0f, size.width, size.height)];
     */
}

- (void)setUpImages
{
    CGFloat width = self.contentView.frame.size.width;
    CGFloat height = self.contentView.frame.size.height;
    NSInteger count = self.imageArray.count;
    
    NSView *backView = [[NSView alloc] initWithFrame:NSMakeRect(0.0f, 0.0f, width*count, height)];
    backView.wantsLayer = YES;
    backView.layer.backgroundColor = [NSColor whiteColor].CGColor;
    [self.contentView addSubview:backView];
    
    for (int i = 0; i < count; i++)
    {
        NSImageView *imageView = [[NSImageView alloc] initWithFrame:NSMakeRect(0.0f, 0.0f, width*i, height)];
        NSString *imageName = [self.imageArray objectAtIndex:i];
        imageView.image = [NSImage imageNamed:imageName];
        [backView addSubview:imageView];
    }
}

#pragma mark - User Action
- (IBAction)freButtonClicked:(id)sender
{
    
}
- (IBAction)nextButtonClicked:(id)sender
{
}

@end
