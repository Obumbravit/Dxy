#import <UIKit/UIKit.h>
#import <Preferences/PSViewController.h>
#import <Preferences/PSListController.h>
#import <Preferences/PSSpecifier.h>
#import <Preferences/PreferencesAppController.h>
#import <Preferences/PSBundleController.h>
#import <Preferences/PSControlTableCell.h>
#import <Preferences/PSDiscreteSlider.h>
#import <Preferences/PSEditableTableCell.h>
#import <Preferences/PSHeaderFooterView.h>
#import <Preferences/PSListItemsController.h>
#import <Preferences/PSRootController.h>
#import <Preferences/PSSliderTableCell.h>
#import <Preferences/PSSwitchTableCell.h>
#import <Preferences/PSSystemPolicyForApp.h>
#import <Preferences/PSTableCell.h> 
#import <spawn.h>

#include "DXYRootListController.h"

@implementation DXYRootListController

- (NSArray *)specifiers
{
	if (!_specifiers)
	{
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

- (id)init
{
  self = [super init];
  if (self)
  {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Apply" style:UIBarButtonItemStylePlain target:self action:@selector(apply)];;
  }
  return self;
}

- (void)twitter
{
	NSURL *url;

	if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetbot:"]])
	{
		url = [NSURL URLWithString:@"tweetbot:///user_profile/Obumbravit"];
	}
	else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitterrific:"]])
	{
		url = [NSURL URLWithString:@"twitterrific:///profile?screen_name=Obumbravit"];
	}
	else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetings:"]])
	{
		url = [NSURL URLWithString:@"tweetings:///user?screen_name=Obumbravit"];
	}
	else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter:"]])
	{
		url = [NSURL URLWithString:@"twitter://user?screen_name=Obumbravit"];
	}
	else
	{
		url = [NSURL URLWithString:@"https://mobile.twitter.com/Obumbravit"];
	}

	[[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
}

- (void)kofi
{
	NSURL *url;

	if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"kofi:"]])
	{
		url = [NSURL URLWithString:@"https://ko-fi.com/obumbravit"];
	}
	else
	{
		url = [NSURL URLWithString:@"https://ko-fi.com/obumbravit"];
	}

	[[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
}

- (void)apply
{
	[self.view endEditing:YES];
	UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Dxy"
    message:@"Settings Applied!"
	preferredStyle:UIAlertControllerStyleAlert];
	//
	UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault
    handler:^(UIAlertAction * action) {}];
	//
	[alert addAction:defaultAction];
	[self presentViewController:alert animated:YES completion:nil];
}

@end