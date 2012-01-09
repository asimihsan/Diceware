//
//  AIPasswordViewController.m
//  Diceware
//
//  Created by Asim Ihsan on 09/01/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AIPasswordViewController.h"

// Private methods
@interface AIPasswordViewController ()
- (void)generatePasswordClicked;
@end

@implementation AIPasswordViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    LOG_V(@"entry.");
    
    // View spans the entire main screen, except the top status bar.
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    
    // Cheeky scroll view to hold contents for now.
    int scroll_view_width = self.view.bounds.size.width;
    int scroll_view_height = self.view.bounds.size.height;
    CGRect frame = CGRectMake(10, 0, scroll_view_width, scroll_view_height);
    UIScrollView *contents_scroll_view = [[UIScrollView alloc] initWithFrame:frame];
    [self.view addSubview:contents_scroll_view];
    [contents_scroll_view release];
    
    frame = CGRectMake(0, 0, 160, 50);
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = frame;
    NSString *title = [NSString stringWithFormat:@"Generate password"];
    [button setTitle:title forState:UIControlStateNormal];
    button.backgroundColor = [UIColor clearColor];
    [button addTarget:self
               action:@selector(generatePasswordClicked)
     forControlEvents:UIControlEventTouchUpInside];
    [contents_scroll_view addSubview:button];
    
    frame = CGRectMake(0, 75, 200, 25);
    UITextField *text_field = [[UITextField alloc] initWithFrame:frame];
    text_field.borderStyle = UITextBorderStyleRoundedRect;
    text_field.textColor = [UIColor blackColor];
    text_field.font = [UIFont systemFontOfSize:17.0];
    text_field.placeholder = @"Password";
    text_field.backgroundColor = [UIColor clearColor];
    text_field.autocorrectionType = UITextAutocorrectionTypeNo;
    text_field.keyboardType = UIKeyboardTypeDefault;
    text_field.returnKeyType = UIReturnKeyDefault;
    text_field.clearButtonMode = UITextFieldViewModeWhileEditing;
    //text_field.delegate = self;
    //text_field.enabled = NO;
    [contents_scroll_view addSubview:text_field];
    [text_field release];
    
    LOG_V(@"exit.");
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark Private methods
- (void)generatePasswordClicked
{
    LOG_V(@"entry.");
    LOG_V(@"exit.");
}

@end
