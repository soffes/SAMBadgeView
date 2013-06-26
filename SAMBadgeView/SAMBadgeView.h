//
//  SAMBadgeView.h
//  SAMBadgeView
//
//  Created by Sam Soffes on 1/29/11.
//  Copyright 2011-2013 Sam Soffes. All rights reserved.
//

/**
 Options for aligning the badge horizontally.
 */
typedef NS_ENUM(NSInteger, SAMBadgeViewAlignment) {
	/** Align badge along the left edge. */
	SAMBadgeViewAlignmentLeft = NSTextAlignmentLeft,

	/** Align badge equally along both sides of the center line. */
	SAMBadgeViewAlignmentCenter = NSTextAlignmentCenter,

	/** Align badge along the right edge. */
	SAMBadgeViewAlignmentRight = NSTextAlignmentRight
};

/**
 Badge view.

 Acts very much like the badges in Mail.app, with the key difference being that Apple uses images and `SSBadgeView` is
 rendered with Core Graphics for improved scrolling performance (although images are supported). This also allows for
 more flexible resizing.
 */

@interface SAMBadgeView : UIView

///--------------------------------
/// @name Accessing the Badge Label
///--------------------------------

/**
 The badge text label.
 */
@property (nonatomic, strong, readonly) UILabel *textLabel;


///-------------------------------------
/// @name Accessing the Badge Attributes
///-------------------------------------

/**
 The badge's background color.

 The default value of this property is grayish blue (that matches Mail.app).

 @see defaultBadgeColor
 */
@property (nonatomic, strong) UIColor *badgeColor;

/**
 The badge's background color while its cell is highlighted.

 The default value of this property is white.
 */
@property (nonatomic, strong) UIColor *highlightedBadgeColor;

/**
 The corner radius used when rendering the badge's outline.

 The default value of this property is 10.
 */
@property (nonatomic, assign) CGFloat cornerRadius;

/**
 The badge's horizontal alignment within the accesoryView frame.

 This will position the badge in the view's bounds accordinly.

 The default value of this property is `SSBadgeViewAlignmentCenter`.
 */
@property (nonatomic, assign) SAMBadgeViewAlignment badgeAlignment;

/**
 A Boolean value indicating whether the receiver should be drawn with a highlight.

 Setting this property causes the receiver to redraw with the appropriate highlight state.

 The default value of this property is `NO`.
 */
@property (nonatomic, assign, getter=isHighlighted) BOOL highlighted;


///---------------------
/// @name Drawing Images
///---------------------

/**
 The badge's background image.

 The default value of this property is `nil`. If the value is non-nil, it will be draw instead of the color.

 Setting a strechable image for this property is recommended.
 */
@property (nonatomic, strong) UIImage *badgeImage;

/**
 The badge's background image while its cell is highlighted.

 The default value of this property is `nil`. If the value is non-nil, it will be draw instead of the color.

 Setting a strechable image for this property is recommended.
 */
@property (nonatomic, strong) UIImage *highlightedBadgeImage;


///---------------
/// @name Defaults
///---------------

/**
 The default badge color.

 @return A color with its value set to the default badge color.
 */
+ (UIColor *)defaultBadgeColor;

@end
