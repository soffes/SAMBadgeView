//
//  SAMBadgeViewTests.m
//  SAMBadgeViewTests
//
//  Created by Sam Soffes on 6/26/13.
//  Copyright (c) 2013 Sam Soffes. All rights reserved.
//

@import XCTest;

#import "SAMBadgeView.h"

@interface SAMBadgeViewTests : XCTestCase
@property (nonatomic, strong) SAMBadgeView *badgeView;
@end

@implementation SAMBadgeViewTests

- (void)setUp {
    [super setUp];
	self.badgeView = [[SAMBadgeView alloc] init];
}


- (void)testHidingWithoutText {
    self.badgeView.textLabel.text = @"42";
	XCTAssertFalse(self.badgeView.hidden);

	self.badgeView.textLabel.text = nil;
	XCTAssertTrue(self.badgeView.hidden);

	self.badgeView.textLabel.text = @"";
	XCTAssertTrue(self.badgeView.hidden);
}

@end
