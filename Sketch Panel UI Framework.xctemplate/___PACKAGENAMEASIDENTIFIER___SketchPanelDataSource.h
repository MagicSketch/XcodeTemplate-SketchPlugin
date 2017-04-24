//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import <Foundation/Foundation.h>

@class ___PACKAGENAMEASIDENTIFIER___SketchPanel;
@class ___PACKAGENAMEASIDENTIFIER___SketchPanelCell;

@protocol ___PACKAGENAMEASIDENTIFIER___SketchPanelDataSource <NSObject>

- (NSUInteger)numberOfRowsFor___PACKAGENAMEASIDENTIFIER___SketchPanel:(___PACKAGENAMEASIDENTIFIER___SketchPanel *)panel;
- (___PACKAGENAMEASIDENTIFIER___SketchPanelCell *)___PACKAGENAMEASIDENTIFIER___SketchPanel:(___PACKAGENAMEASIDENTIFIER___SketchPanel *)panel itemForRowAtIndex:(NSUInteger)index;
- (___PACKAGENAMEASIDENTIFIER___SketchPanelCell *)headerFor___PACKAGENAMEASIDENTIFIER___SketchPanel:(___PACKAGENAMEASIDENTIFIER___SketchPanel *)panel;

@end
