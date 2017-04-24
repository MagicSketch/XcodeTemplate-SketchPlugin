//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "___PACKAGENAMEASIDENTIFIER___SketchPanelCell.h"

@interface ___PACKAGENAMEASIDENTIFIER___SketchPanelCell ()

@end

@implementation ___PACKAGENAMEASIDENTIFIER___SketchPanelCell

- (NSView *)view {
    return self;
}

+ (instancetype)loadNibNamed:(NSString *)nibName {
    NSNib *nib = [[NSNib alloc] initWithNibNamed:nibName bundle:[NSBundle bundleForClass:[self class]]];
    NSArray *views;
    [nib instantiateWithOwner:nil topLevelObjects:&views];

    NSArray *filtered = [views filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id  _Nullable evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        return [evaluatedObject isKindOfClass:[self class]];
    }]];

    return [filtered firstObject];
}

@end
