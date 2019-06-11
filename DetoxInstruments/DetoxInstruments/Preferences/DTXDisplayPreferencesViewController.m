//
//  DTXDisplayPreferencesViewController.m
//  DetoxInstruments
//
//  Created by Leo Natan (Wix) on 6/11/19.
//  Copyright © 2019 Wix. All rights reserved.
//

#import "DTXDisplayPreferencesViewController.h"
#import "CCNPreferencesWindowControllerProtocol.h"
#import "NSAppearance+UIAdditions.h"

@interface DTXDisplayPreferencesViewController () <CCNPreferencesWindowControllerProtocol>
{
	IBOutlet NSButton* _lightAppearanceButton;
	IBOutlet NSButton* _darkAppearanceButton;
	IBOutlet NSButton* _autoAppearanceButton;
}

@end

@implementation DTXDisplayPreferencesViewController

- (NSImage *)preferenceIcon
{
	return [NSImage imageNamed:NSImageNamePreferencesGeneral];
}

- (NSString *)preferenceIdentifier
{
	return @"General";
}

- (NSString *)preferenceTitle
{
	return NSLocalizedString(@"General", @"");
}

- (NSImage*)_redrawingImageWithName:(NSString*)imageName overlayImageName:(NSString*)overlayImageName userDefaultsKey:(NSString*)userDefaultsKey highlightingValue:(NSInteger)value
{
	NSImage* image = [NSImage imageNamed:imageName];
	NSImage* overlayImage = nil;
	if(overlayImageName.length > 0)
	{
		overlayImage = [NSImage imageNamed:overlayImageName];
	}
	NSImage* rv = [NSImage imageWithSize:NSMakeSize(image.size.width + 3, image.size.height + 3) flipped:NO drawingHandler:^BOOL(NSRect dstRect) {
		if([NSUserDefaults.standardUserDefaults integerForKey:userDefaultsKey] == value)
		{
			NSBezierPath* path = [NSBezierPath bezierPathWithRoundedRect:CGRectInset(dstRect, 2, 2) xRadius:4 yRadius:4];
			path.lineWidth = 4.0;
			[[[NSColor.controlAccentColor colorWithSystemEffect:NSColorSystemEffectRollover] colorWithAlphaComponent:0.4] setStroke];
			[path stroke];
		}
		
		[image drawInRect:CGRectMake(1.5, 1.5, image.size.width, image.size.height)];
		[overlayImage drawInRect:CGRectMake(1.5, 1.5, overlayImage.size.width, overlayImage.size.height)];
		
		if(overlayImageName.length > 0)
		{
			NSBezierPath* path = [NSBezierPath bezierPathWithRect:NSMakeRect(1.5 + 12, image.size.height - 6 + 1.5, 32, 6)];
			[NSColor.controlAccentColor setFill];
			[path fill];
		}
		
		return YES;
	}];
	rv.cacheMode = NSImageCacheNever;
	
	return rv;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	_autoAppearanceButton.image = [self _redrawingImageWithName:@"pref_appearance_auto"  overlayImageName:nil userDefaultsKey:DTXPreferencesAppearanceKey highlightingValue:0];
	_lightAppearanceButton.image = [self _redrawingImageWithName:@"pref_appearance_dark" overlayImageName:@"pref_window_light" userDefaultsKey:DTXPreferencesAppearanceKey highlightingValue:1];
	_darkAppearanceButton.image = [self _redrawingImageWithName:@"pref_appearance_light" overlayImageName:@"pref_window_dark" userDefaultsKey:DTXPreferencesAppearanceKey highlightingValue:2];
}

- (IBAction)changeAppearance:(NSButton*)sender
{
	[NSUserDefaults.standardUserDefaults setInteger:sender.tag forKey:DTXPreferencesAppearanceKey];
	
	[_autoAppearanceButton.image recache];
	_autoAppearanceButton.highlighted = YES;
	_autoAppearanceButton.highlighted = NO;
	[_lightAppearanceButton.image recache];
	_lightAppearanceButton.highlighted = YES;
	_lightAppearanceButton.highlighted = NO;
	[_darkAppearanceButton.image recache];
	_darkAppearanceButton.highlighted = YES;
	_darkAppearanceButton.highlighted = NO;
}


@end
