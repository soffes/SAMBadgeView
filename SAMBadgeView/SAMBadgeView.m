//
//  SAMBadgeView.m
//  SAMBadgeView
//
//  Created by Sam Soffes on 1/29/11.
//  Copyright 2011-2013 Sam Soffes. All rights reserved.
//

#import "SAMBadgeView.h"

@implementation SAMBadgeView

#pragma mark - Accessors

@synthesize textLabel = _textLabel;


- (UILabel *)textLabel {
	if (!_textLabel) {
		_textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		_textLabel.text = @"0";
		_textLabel.textColor = [UIColor whiteColor];
		_textLabel.highlightedTextColor = [UIColor colorWithRed:0.125f green:0.369f blue:0.871f alpha:1.0f];
		_textLabel.font = [UIFont boldSystemFontOfSize:16.0f];
		_textLabel.textAlignment = NSTextAlignmentCenter;

		[_textLabel addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:(__bridge void *)self];
	}
	return _textLabel;
}


- (void)setBadgeColor:(UIColor *)badgeColor {
	_badgeColor = badgeColor;
	[self setNeedsDisplay];
}


- (void)setHighlightedBadgeColor:(UIColor *)highlightedBadgeColor {
	_highlightedBadgeColor = highlightedBadgeColor;
	[self setNeedsDisplay];
}


- (void)setBadgeImage:(UIImage *)badgeImage {
	_badgeImage = badgeImage;
	[self setNeedsDisplay];
}


- (void)setHighlightedBadgeImage:(UIImage *)highlightedBadgeImage {
	_highlightedBadgeImage = highlightedBadgeImage;
	[self setNeedsDisplay];
}


- (void)setCornerRadius:(CGFloat)cornerRadius {
	_cornerRadius = cornerRadius;
	[self setNeedsDisplay];
}


- (void)setBadgeAlignment:(SAMBadgeViewAlignment)badgeAlignment {
	_badgeAlignment = badgeAlignment;
	[self setNeedsDisplay];
}


- (void)setHighlighted:(BOOL)highlighted {
	_highlighted = highlighted;
	_textLabel.highlighted = highlighted;
	[self setNeedsDisplay];
}


#pragma mark - Class Methods

+ (UIColor *)defaultBadgeColor {
	return [UIColor colorWithRed:0.541f green:0.596f blue:0.694f alpha:1.0f];
}


#pragma mark - NSObject

- (void)dealloc {
	[_textLabel removeObserver:self forKeyPath:@"text" context:(__bridge void *)self];
}


#pragma mark - UIView

- (id)initWithCoder:(NSCoder *)aDecoder {
	if ((self = [super initWithCoder:aDecoder])) {
		[self initialize];
	}
	return self;
}


- (id)initWithFrame:(CGRect)rect {
	if ((self = [super initWithFrame:rect])) {
		[self initialize];
	}
	return self;
}


- (void)drawRect:(CGRect)rect {
	UIColor *currentBadgeColor = self.highlighted && self.highlightedBadgeColor ? self.highlightedBadgeColor : self.badgeColor;
	UIImage *currentBadgeImage = self.highlighted && self.highlightedBadgeImage ? self.highlightedBadgeImage : self.badgeImage;

	// Badge
	CGSize size = self.frame.size;
	CGSize badgeSize = [self sizeThatFits:size];
	badgeSize.height = fminf(badgeSize.height, size.height);

	// Badge alignment
	CGFloat x = 0.0f;
	if (self.badgeAlignment == SAMBadgeViewAlignmentCenter) {
		x = roundf((size.width - badgeSize.width) / 2.0f);
	} else if (self.badgeAlignment == SAMBadgeViewAlignmentRight) {
		x = size.width - badgeSize.width;
	}

	CGRect badgeRect = CGRectMake(x, roundf((size.height - badgeSize.height) / 2.0f), badgeSize.width, badgeSize.height);

	// Draw image
	if (currentBadgeImage) {
		[currentBadgeImage drawInRect:badgeRect];
	}

	// Draw rectangle
	else if (currentBadgeColor) {
		[currentBadgeColor setFill];

		UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:badgeRect cornerRadius:self.cornerRadius];
		[path fill];
	}

	// Text
	[self.textLabel drawTextInRect:badgeRect];
}


- (CGSize)sizeThatFits:(CGSize)size {
	CGSize textSize = [self.textLabel sizeThatFits:self.bounds.size];
	return CGSizeMake(fmaxf(textSize.width + 12.0f, 30.0f), textSize.height + 8.0f);
}


#pragma mark - Private

- (void)initialize {
	self.contentMode = UIViewContentModeRedraw;
	self.backgroundColor = [UIColor clearColor];

	self.badgeColor = [[self class] defaultBadgeColor];
	self.highlightedBadgeColor = [UIColor whiteColor];
	self.cornerRadius = 10.0f;
	self.badgeAlignment = SAMBadgeViewAlignmentCenter;
	self.highlighted = NO;
}


#pragma mark - NSKeyValueObserving

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
	if (context != (__bridge void *)self) {
		[super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
		return;
	}

	if (object == _textLabel && [keyPath isEqualToString:@"text"]) {
		NSString *text = [change objectForKey:NSKeyValueChangeNewKey];
		if ([text isEqual:[NSNull null]]) {
			text = nil;
		}
		self.hidden = ([text length] == 0);

		if (!self.hidden) {
			[self setNeedsDisplay];
		}
		return;
	}
}

@end