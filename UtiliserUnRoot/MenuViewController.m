//
//  MenuViewController.m
//  UtiliserUnRoot
//
//  Created by Marian PAUL on 21/03/12.
//  Copyright (c) 2012 iPuP SARL. All rights reserved.
//

#import "MenuViewController.h"
#import "AppDelegate.h"
#import "RootViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton *boutonJeu = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [boutonJeu setFrame:CGRectMake(20, 20, 160, 30)];
    [boutonJeu addTarget:self action:@selector(changePourJeu:) forControlEvents:UIControlEventTouchUpInside];
    [boutonJeu setTitle:@"Aller dans jeu" forState:UIControlStateNormal];
    [self.view addSubview:boutonJeu];
    
    UIButton *boutonParametres = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [boutonParametres setFrame:CGRectMake(20, 60, 200, 30)];
    [boutonParametres addTarget:self action:@selector(changePourParametres:) forControlEvents:UIControlEventTouchUpInside];
    [boutonParametres setTitle:@"Aller dans les paramètres" forState:UIControlStateNormal];
    [self.view addSubview:boutonParametres];
    
    UILabel *labelStatut = [[UILabel alloc] initWithFrame:CGRectMake(30, 30, 260, 30)];
    [labelStatut setCenter:self.view.center];
    labelStatut.text = @"On est sur le menu";
    labelStatut.textColor = [UIColor blueColor];
    labelStatut.backgroundColor = [UIColor clearColor];
    [self.view addSubview:labelStatut];
}

- (void) changePourJeu : (id) sender 
{
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    [appDelegate.rootViewController changePourJeu];
}

- (void) changePourParametres : (id) sender 
{
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    [appDelegate.rootViewController changePourParametres];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
