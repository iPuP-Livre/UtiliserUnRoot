//
//  RootViewController.h
//  UtiliserUnRoot
//
//  Created by Marian PAUL on 21/03/12.
//  Copyright (c) 2012 iPuP SARL. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MenuViewController;
@class JeuViewController;
@class ParametresViewController;

@interface RootViewController : UIViewController
{
    MenuViewController *_menuViewController;
    JeuViewController *_jeuViewController;
    ParametresViewController *_parametresViewController;
}

- (void) changePourJeu;
- (void) changePourParametres;

@end
