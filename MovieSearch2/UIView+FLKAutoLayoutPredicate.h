//
// Created by florian on 26.03.13.
//
// To change the template use AppCode | Preferences | File Templates.
//

@import UIKit;
@import Foundation;


typedef struct {
    NSLayoutRelation relation;
    CGFloat multiplier;
    CGFloat constant;
    UILayoutPriority priority;
} FLKAutoLayoutPredicate;

extern FLKAutoLayoutPredicate FLKAutoLayoutPredicateMake(NSLayoutRelation relation, CGFloat multiplier, CGFloat constant, UILayoutPriority priority);


@interface UIView (FLKAutoLayoutPredicate)

- (NSLayoutConstraint*)applyPredicate:(FLKAutoLayoutPredicate)predicate toView:(UIView*)toView attribute:(NSLayoutAttribute)attribute;
- (NSLayoutConstraint*)applyPredicate:(FLKAutoLayoutPredicate)predicate toView:(UIView*)view fromAttribute:(NSLayoutAttribute)fromAttribute toAttribute:(NSLayoutAttribute)toAttribute;

@end