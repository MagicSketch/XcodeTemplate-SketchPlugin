//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import <Foundation/Foundation.h>
#import "___PACKAGENAMEASIDENTIFIER___SketchPanelDataSource.h"
#import "___PACKAGENAMEASIDENTIFIER___MSInspectorStackView.h"

@class ___PACKAGENAMEASIDENTIFIER___SketchPanelCell;

@interface ___PACKAGENAMEASIDENTIFIER___SketchPanel : NSObject

@property (nonatomic, strong, readonly) NSArray *views;
@property (nonatomic, weak) id <___PACKAGENAMEASIDENTIFIER___MSInspectorStackView> stackView;
@property (nonatomic, weak) id <___PACKAGENAMEASIDENTIFIER___SketchPanelDataSource> datasource;

- (instancetype)initWithStackView:(id <___PACKAGENAMEASIDENTIFIER___MSInspectorStackView>)stackView;
- (void)reloadData;
- (___PACKAGENAMEASIDENTIFIER___SketchPanelCell *)dequeueReusableCellForReuseIdentifier:(NSString *)identifier;

@end
