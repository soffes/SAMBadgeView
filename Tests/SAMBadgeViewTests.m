//
//  SAMBadgeViewTests.m
//  SAMBadgeViewTests
//
//  Created by Sam Soffes on 6/26/13.
//  Copyright (c) 2013 Sam Soffes. All rights reserved.
//

#import "SAMBadgeViewTests.h"
#import "SAMBadgeView.h"

@interface SAMBadgeViewTests ()
@property (nonatomic, strong) SAMBadgeView *badgeView;
@end

@implementation SAMBadgeViewTests

- (void)setUp {
    [super setUp];
	self.badgeView = [[SAMBadgeView alloc] init];
}


- (void)testHidingWithoutText {
    self.badgeView.textLabel.text = @"42";
	STAssertFalse(self.badgeView.hidden, nil);

	self.badgeView.textLabel.text = nil;
	STAssertTrue(self.badgeView.hidden, nil);

	self.badgeView.textLabel.text = @"";
	STAssertTrue(self.badgeView.hidden, nil);
}

@end
