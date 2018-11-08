//
//  ViewController.m
//  AddItUp
//
//  Created by Mike Laursen on 11/7/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (strong, nonatomic) NSArray *addends;
@property (strong, nonatomic) NSNumber *addend;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)onClearTapped:(UIButton *)sender {
}

- (IBAction)onClearEntryTapped:(UIButton *)sender {
}

- (IBAction)onDigitTapped:(UIButton *)sender {
    _addend = [NSNumber numberWithInt: 10 * _addend.intValue + [sender.titleLabel.text intValue]];
    [self updateDisplay];
}

- (IBAction)onMinusTapped:(UIButton *)sender {
    if (_addend) {
        _addend = [NSNumber numberWithInt: -1 * _addend.intValue];
        [self addAddendToAddends];
    }
    [self updateDisplay];
}

- (IBAction)onPlusTapped:(UIButton *)sender {
    [self addAddendToAddends];
    [self updateDisplay];
}

#pragma mark - Utility

- (void)addAddendToAddends {
    if (_addend) {
        NSMutableArray *addendsMutable = [NSMutableArray arrayWithArray:_addends];
        [addendsMutable addObject:_addend];
        _addends = addendsMutable;
        _addend = nil;
    }
}

- (void)updateDisplay {
    NSString *displayText = @"";
    
    for (id addend in _addends) {
        NSNumber *addendValue = (NSNumber *)addend;
        displayText = [displayText stringByAppendingString:addendValue.stringValue];
        displayText = [displayText stringByAppendingString:@"\n"];
    }
    
    if (_addend) {
        displayText = [displayText stringByAppendingString:_addend.stringValue];
        displayText = [displayText stringByAppendingString:@"\n"];
    }
    
    [_textView setText:displayText];
}

@end
