//
//  JeuViewController.m
//  UtiliserUnRoot
//
//  Created by Marian PAUL on 21/03/12.
//  Copyright (c) 2012 iPuP SARL. All rights reserved.
//

#import "JeuViewController.h"
#import "AppDelegate.h"
#import "RootViewController.h"

@interface JeuViewController ()

@end

@implementation JeuViewController

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

    UIButton *boutonMenu = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [boutonMenu setFrame:CGRectMake(20, 20, 160, 30)];
    [boutonMenu addTarget:self action:@selector(changePourMenu:) forControlEvents:UIControlEventTouchUpInside];
    [boutonMenu setTitle:@"Retour au menu" forState:UIControlStateNormal];
    [self.view addSubview:boutonMenu];
    
    UILabel *labelStatut = [[UILabel alloc] initWithFrame:CGRectMake(30, 30, 260, 30)];
    [labelStatut setCenter:self.view.center];
    labelStatut.text = @"On est sur le jeu";
    labelStatut.textColor = [UIColor redColor];
    labelStatut.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:labelStatut];
}
- (void) changePourMenu : (id) sender 
{
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    // on appelle changePourJeu qui va nous permettre de revenir au menu
    [appDelegate.rootViewController changePourJeu];
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
