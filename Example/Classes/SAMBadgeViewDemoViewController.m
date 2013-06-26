//
//  SAMBadgeViewDemoViewController.m
//  SAMBadgeView
//
//  Created by Sam Soffes on 6/26/13.
//  Copyright (c) 2013 Sam Soffes. All rights reserved.
//

#import "SAMBadgeViewDemoViewController.h"
#import "SAMBadgeView.h"

@implementation SAMBadgeViewDemoViewController

#pragma mark - NSObject

- (id)init {
	return self = [super initWithStyle:UITableViewStyleGrouped];
}


#pragma mark - UIViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.title = @"Badge View";
}


- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self.tableView reloadData];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
		return toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown;
	}
	return YES;
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return (section == 0) ? 4 : 12;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";

	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];

		// Setup cell accessory
		SAMBadgeView *badge = [[SAMBadgeView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 55.0f, 20.0f)];
		badge.badgeAlignment = SAMBadgeViewAlignmentRight;
		cell.accessoryView = badge;
	}

	SAMBadgeView *badgeView = (SAMBadgeView *)cell.accessoryView;

	if (indexPath.section == 0) {
		switch (indexPath.row) {
			case 0: {
				cell.textLabel.text = @"Default Badge View";
				badgeView.textLabel.text = @"0";
				badgeView.badgeColor = [SAMBadgeView defaultBadgeColor];
				break;
			}

			case 1: {
				cell.textLabel.text = @"Unread Count";
				badgeView.textLabel.text = @"3";
				badgeView.badgeColor = [UIColor colorWithRed:0.969f green:0.082f blue:0.078f alpha:1.0f];
				break;
			}

			case 2: {
				cell.textLabel.text = @"Text Badge";
				badgeView.textLabel.text = @"New";
				badgeView.badgeColor = [UIColor colorWithRed:0.388f green:0.686f blue:0.239f alpha:1.0f];
				break;
			}

			case 3: {
				cell.textLabel.text = @"Nil value";
				badgeView.textLabel.text = nil;
				badgeView.badgeColor = [SAMBadgeView defaultBadgeColor];
				break;
			}
		}
	} else {
		NSNumber *number = [NSNumber numberWithInteger:indexPath.row * 256];
		cell.textLabel.text = [[NSNumberFormatter localizedStringFromNumber:number numberStyle:NSNumberFormatterSpellOutStyle] capitalizedString];
		badgeView.textLabel.text = [NSNumberFormatter localizedStringFromNumber:number numberStyle:NSNumberFormatterDecimalStyle];
		badgeView.badgeColor = [SAMBadgeView defaultBadgeColor];
	}

	return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
