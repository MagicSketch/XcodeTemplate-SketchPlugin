//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "___PACKAGENAMEASIDENTIFIER___SketchPanel.h"
#import "___PACKAGENAMEASIDENTIFIER___SketchPanelCell.h"

@interface ___PACKAGENAMEASIDENTIFIER___SketchPanel ()

@property (nonatomic, copy) NSArray *items;
@property (nonatomic, weak) id <___PACKAGENAMEASIDENTIFIER___MSInspectorStackView> stackView;
@property (nonatomic, strong) NSMutableDictionary *recycler;

@end

@implementation ___PACKAGENAMEASIDENTIFIER___SketchPanel

- (instancetype)initWithStackView:(id<___PACKAGENAMEASIDENTIFIER___MSInspectorStackView>)stackView {
    self = [super init];
    if (self) {
        _stackView = stackView;
        _recycler = [NSMutableDictionary dictionary];
    }
    return self;
}

- (NSArray *)views {
    return [self.items valueForKeyPath:@"view"];
}

- (void)recycleCell:(___PACKAGENAMEASIDENTIFIER___SketchPanelCell *)cell {
    NSString *identifier = [cell reuseIdentifier];

    if ( ! identifier) {
        return;
    }

    NSMutableSet *set = _recycler[identifier];
    if ( ! set) {
        set = [NSMutableSet set];
        _recycler[identifier] = set;
    }
    [set addObject:cell];
}

- (___PACKAGENAMEASIDENTIFIER___SketchPanelCell *)dequeueReusableCellForReuseIdentifier:(NSString *)identifier {
    NSMutableSet *set = _recycler[identifier];
    id cell = [set anyObject];
    if (cell) {
        [set removeObject:cell];
    }
    return cell;
}

- (void)reloadData {
    NSMutableArray *sectionViewControllers = [[_stackView sectionViewControllers] mutableCopy];
    [sectionViewControllers addObject:self];

    NSUInteger count = [self.datasource numberOfRowsFor___PACKAGENAMEASIDENTIFIER___SketchPanel:self];
    NSMutableArray *items = [NSMutableArray array];

    // Add header
    [items insertObject:[self.datasource headerFor___PACKAGENAMEASIDENTIFIER___SketchPanel:self] atIndex:0];

    // Add cells
    for (NSUInteger i = 0; i < count; i++) {
        [items addObject:[self.datasource ___PACKAGENAMEASIDENTIFIER___SketchPanel:self itemForRowAtIndex:i]];
    }

    // Recycle cells
    [self.items enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self recycleCell:obj];
    }];

    self.items = items;
    [_stackView reloadWithViewControllers:sectionViewControllers];
}

- (BOOL)wantsSeparatorBetweenView:(NSView *)view andView:(NSView *)nextView {
    if ( view == [self.items firstObject]
        || ! nextView) { // At the first and the end
        return YES;
    }
    return NO;
}

@end
