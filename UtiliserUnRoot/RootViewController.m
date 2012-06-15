//
//  RootViewController.m
//  UtiliserUnRoot
//
//  Created by Marian PAUL on 21/03/12.
//  Copyright (c) 2012 iPuP SARL. All rights reserved.
//

#import "RootViewController.h"
#import "MenuViewController.h"
#import "JeuViewController.h"
#import "ParametresViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

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
    _menuViewController = [[MenuViewController alloc] initWithNibName:@"MenuViewController" bundle:nil];
    [self.view addSubview:_menuViewController.view];
}

- (void) changePourJeu 
{
    if (!_jeuViewController) { // rappelez-vous, on n'alloue que si l'on a besoin
        _jeuViewController = [[JeuViewController alloc] initWithNibName:@"JeuViewController" bundle:nil];
    }
    
    // on fait référence sur les vues de menu et jeu
    UIView *menuView = _menuViewController.view;
    UIView *jeuView = _jeuViewController.view;
    
    if([menuView superview] != nil) // si menuView repose sur une vue, alors on l'enlève [1]
    {
        [_jeuViewController viewWillAppear:NO];  // [2]
        [_menuViewController viewWillDisappear:NO];
        [menuView removeFromSuperview];
        [self.view addSubview:jeuView];
        [_jeuViewController viewDidAppear:NO];
        [_menuViewController viewDidDisappear:NO];
    }
    else // sinon, c'est jeuView que l'on enlève
    {
        [_menuViewController viewWillAppear:NO];
        [_jeuViewController viewWillDisappear:NO];
        [jeuView removeFromSuperview];
        [self.view addSubview:menuView];
        [_menuViewController viewDidAppear:NO];
        [_jeuViewController viewDidDisappear:NO];
    }
}


- (void) changePourParametres 
{
    if (!_parametresViewController) { // rappelez-vous, on n'alloue que si l'on a besoin
        _parametresViewController = [[ParametresViewController alloc] initWithNibName:@"ParametresViewController" bundle:nil];
    }
    
    // on fait référence sur les vues de menu et paramètres
    UIView *menuView = _menuViewController.view;
    UIView *paramView = _parametresViewController.view;
    
    [UIView beginAnimations:@"flipAnimation" context:nil]; // réinitialiser le layer
    [UIView setAnimationDuration:0.5]; // durée de l'animation
    if([menuView superview] != nil) // si menuView repose sur une vue, alors on l'enlève
    {
        [_parametresViewController viewWillAppear:YES];
        [_menuViewController viewWillDisappear:YES];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES]; // type de l'animation
        [menuView removeFromSuperview];
        [self.view addSubview:paramView];
        [_parametresViewController viewDidAppear:YES];
        [_menuViewController viewDidDisappear:YES];
    }
    else // sinon, c'est paramView que l'on enlève
    {
        [_menuViewController viewWillAppear:YES];
        [_parametresViewController viewWillDisappear:YES];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
        [paramView removeFromSuperview];
        [self.view addSubview:menuView];
        [_menuViewController viewDidAppear:YES];
        [_parametresViewController viewDidDisappear:YES];
    }
    [UIView commitAnimations]; // lancer l'animation
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
