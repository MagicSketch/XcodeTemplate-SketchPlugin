//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

@import Cocoa;
#import "___PACKAGENAMEASIDENTIFIER___MSDocument.h"
#import "___PACKAGENAMEASIDENTIFIER___MSInspectorStackView.h"
#import "___PACKAGENAMEASIDENTIFIER___SketchPanelDataSource.h"
@class ___PACKAGENAMEASIDENTIFIER___SketchPanel;

@interface ___PACKAGENAMEASIDENTIFIER___SketchPanelController : NSObject <___PACKAGENAMEASIDENTIFIER___SketchPanelDataSource>

@property (nonatomic, strong, readonly) id <___PACKAGENAMEASIDENTIFIER___MSInspectorStackView> stackView; // MSInspectorStackView
@property (nonatomic, strong, readonly) id <___PACKAGENAMEASIDENTIFIER___MSDocument> document;
@property (nonatomic, strong, readonly) ___PACKAGENAMEASIDENTIFIER___SketchPanel *panel;

- (instancetype)initWithDocument:(id <___PACKAGENAMEASIDENTIFIER___MSDocument>)document;
- (void)selectionDidChange:(NSArray *)selection;

@end
