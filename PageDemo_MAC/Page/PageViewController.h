//
//  PageViewController.h
//  PageDemo_MAC
//
//  Created by sunny on 2017/6/9.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PageViewController : NSViewController

@property(nonatomic, strong) NSArray<NSString *> *imageArray;

@property (weak) IBOutlet NSView *contentView;
@property (weak) IBOutlet NSButton *freButton;
@property (weak) IBOutlet NSButton *nextButton;

- (instancetype)initWithImageArray:(NSArray<NSString*>*)imageArray;

@end
