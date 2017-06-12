//
//  PageViewController.m
//  PageDemo_MAC
//
//  Created by sunny on 2017/6/9.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "PageViewController.h"

@interface PageViewController ()

@property (nonatomic, strong) NSView *scrollView;
@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation PageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.currentIndex = 0;
    
    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = [NSColor orangeColor].CGColor;
    self.imageArray = @[@"btn-fre",@"btn-next"];
    
    CGFloat width = self.contentView.frame.size.width;
    CGFloat height = self.contentView.frame.size.height;
    NSInteger count = self.imageArray.count;
    
    self.scrollView = [[NSView alloc] initWithFrame:NSMakeRect(0.0f, 0.0f, width*count, height)];
    self.scrollView.wantsLayer = YES;
    self.scrollView.layer.backgroundColor = [NSColor blackColor].CGColor;
    [self.contentView addSubview:self.scrollView];
    
    for (int i = 0; i < count; i++)
    {
        /*
        NSImageView *imageView = [[NSImageView alloc] initWithFrame:NSMakeRect(0.0f, 0.0f, width*i, height)];
        NSString *imageName = [self.imageArray objectAtIndex:i];
        imageView.image = [NSImage imageNamed:imageName];
        [backView addSubview:imageView];
         */
        NSView *view = [[NSView alloc] initWithFrame:NSMakeRect(width*i, 0.0f, width, height)];
        view.wantsLayer = YES;
        if (i ==1)
        {
            //view.layer.backgroundColor = [NSColor whiteColor].CGColor;
        }
        else
        {
            view.layer.backgroundColor = [NSColor blueColor].CGColor;
        }
        
        [self.scrollView addSubview:view];
    }
    
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



#pragma mark - Private Methods
#pragma mark - Private Method
- (void)setCurrentImageWithIndex:(NSInteger)index
{
    BOOL nextBtnTapped = self.currentIndex > index ? YES : NO;
    self.currentIndex = index;
    
    self.freButton.hidden = (index == 0);
    self.nextButton.hidden = (index == self.imageArray.count-1);
    
    CGFloat width = self.contentView.frame.size.width;
    CGFloat height = self.contentView.frame.size.height;
    NSRect rect = NSMakeRect(-width*index, 0.0f, width*self.imageArray.count, height);
    [[self.scrollView animator] setFrame:rect];
}

#pragma mark - User Action
- (IBAction)freButtonClicked:(id)sender
{
    NSInteger index = self.currentIndex;
    [self setCurrentImageWithIndex:index - 1];
}
- (IBAction)nextButtonClicked:(id)sender
{
    NSInteger index = self.currentIndex;
    [self setCurrentImageWithIndex:index + 1];
}

@end
