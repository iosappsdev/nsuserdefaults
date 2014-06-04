//
//  ViewController.m
//  nsuserdefaults
//
//  Created by CtecTeacher on 3/11/14.
//  Copyright (c) 2014 CtecTeacher. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tf_name;
@property (weak, nonatomic) IBOutlet UITextField *tf_email;
@property (weak, nonatomic) IBOutlet UITextField *tf_age;
- (IBAction)saveData:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *name = [defaults objectForKey:@"firstName"];
    NSString *email = [defaults objectForKey:@"email"];
    int age = [defaults integerForKey:@"age"];
    NSString *ageString = [NSString stringWithFormat:@"%i", age];

    _tf_name.text = name;
    _tf_email.text = email;
    _tf_age.text = ageString;

    
    _tf_age.keyboardType = UIKeyboardTypeNumberPad;
}

- (IBAction)saveData:(id)sender {
    
    [_tf_age resignFirstResponder];
    [_tf_name resignFirstResponder];
    [_tf_email resignFirstResponder];
    
    NSString *name = _tf_name.text;
    NSString *email = _tf_email.text;
    int age = [[_tf_age text] integerValue];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:name forKey:@"firstName"];
    [defaults setObject:email forKey:@"email"];
    [defaults setInteger:age forKey:@"age"];
    
    [defaults synchronize];
    
}


@end
