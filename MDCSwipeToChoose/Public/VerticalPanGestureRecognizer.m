//
//  VerticalPanGestureRecognizer.m
//  Pods
//
//  Created by Clinton Buie on 12/4/15.
//
//

#import "VerticalPanGestureRecognizer.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

@interface VerticalPanGestureRecognizer ()

@property (nonatomic, assign) CGPoint origLoc;

@end

@implementation VerticalPanGestureRecognizer

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.origLoc = [[touches anyObject] locationInView:self.view.superview];
    [super touchesBegan:touches withEvent:event];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.state == UIGestureRecognizerStatePossible) {
        CGPoint loc = [[touches anyObject] locationInView:self.view.superview];
        CGFloat deltaX = fabs(loc.x - self.origLoc.x);
        CGFloat deltaY = fabs(loc.y - self.origLoc.y);
        if (deltaX < deltaY) {
            self.state = UIGestureRecognizerStateFailed;
        }
    }
    [super touchesMoved:touches withEvent:event];
}


@end
