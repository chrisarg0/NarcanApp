//
//  UIView+Border.h
//  Videre
//
//  Created by Alex on 12/29/15.
//  Copyright © 2015 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Border)

@property (nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable CGFloat borderWidth;
@property (nonatomic) IBInspectable CGFloat cornerRadius;

@end
