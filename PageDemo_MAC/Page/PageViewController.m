//
//  PageViewController.m
//  PageDemo_MAC
//
//  Created by sunny on 2017/6/9.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "PageViewController.h"
#import "MXPageControl.h"

@interface PageViewController ()<MXPageControlDelegate>

@property (nonatomic, strong) NSView *scrollView;
@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, strong) MXPageControl *pageControl;

@end

@implementation PageViewController

- (instancetype)initWithImageArray:(NSArray<NSString*>*)imageArray
{
    self = [[PageViewController alloc] init];
    if (self)
    {
        self.imageArray = imageArray;
        self.currentIndex = 0;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = [NSColor orangeColor].CGColor;
    
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
    
     // Setup page control
    NSRect frame = self.contentView.frame;
    self.pageControl = [[MXPageControl alloc] init];
    [self.pageControl setDelegate: self];
    [self.pageControl setNumberOfPages: self.imageArray.count];
    [self.pageControl setIndicatorDiameterSize: 15];
    [self.pageControl setIndicatorMargin: 5];
    [self.pageControl setCurrentPage: 0];
    [self.pageControl setDrawingBlock: ^(NSRect frame, NSView *aView, BOOL isSelected, BOOL isHighlighted){
    frame = CGRectInset(frame, 2.0, 2.0);
    NSBezierPath *path = [NSBezierPath bezierPathWithOvalInRect: frame];
    NSColor *color = isSelected ? [NSColor whiteColor] :
    [NSColor colorWithCalibratedRed: (149.0f / 255.0) green: (204.0f / 255.0) blue: (249.0f / 255.0) alpha: 1.0];
    [color set];
    [path fill];
    }];
    [self.contentView addSubview:self.pageControl];
    CGSize size = [self.pageControl intrinsicContentSize];
    [self.pageControl setFrame: CGRectMake((frame.size.width - size.width)/2.0f, 15.0f, size.width, size.height)];
}

#pragma mark - Private Methods
- (void)setCurrentImageWithIndex:(NSInteger)index
{
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
    [self.pageControl setCurrentPage:index - 1];
}
- (IBAction)nextButtonClicked:(id)sender
{
    NSInteger index = self.currentIndex;
    [self setCurrentImageWithIndex:index + 1];
    [self.pageControl setCurrentPage:index + 1];
}

#pragma mark - MXPageControlDelegate
-(void)pageControl: (MXPageControl *)pageControl didSelectPageAtIndex: (NSInteger)index
{
    [self setCurrentImageWithIndex:index];
}

@end
