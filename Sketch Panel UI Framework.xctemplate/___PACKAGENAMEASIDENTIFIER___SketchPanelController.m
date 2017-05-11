//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "___PACKAGENAMEASIDENTIFIER___SketchPanelController.h"
#import "___PACKAGENAMEASIDENTIFIER___SketchPanelCell.h"
#import "___PACKAGENAMEASIDENTIFIER___SketchPanelCellHeader.h"
#import "___PACKAGENAMEASIDENTIFIER___SketchPanelCellDefault.h"
#import "___PACKAGENAMEASIDENTIFIER___SketchPanel.h"
#import "___PACKAGENAMEASIDENTIFIER___SketchPanelDataSource.h"


@interface ___PACKAGENAMEASIDENTIFIER___SketchPanelController ()

@property (nonatomic, strong) id <___PACKAGENAMEASIDENTIFIER___MSInspectorStackView> stackView; // MSInspectorStackView
@property (nonatomic, strong) id <___PACKAGENAMEASIDENTIFIER___MSDocument> document;
@property (nonatomic, strong) ___PACKAGENAMEASIDENTIFIER___SketchPanel *panel;
@property (nonatomic, copy) NSArray *selection;

@end

@implementation ___PACKAGENAMEASIDENTIFIER___SketchPanelController

- (instancetype)initWithDocument:(id <___PACKAGENAMEASIDENTIFIER___MSDocument>)document {
    if (self = [super init]) {
        _document = document;
        _panel = [[___PACKAGENAMEASIDENTIFIER___SketchPanel alloc] initWithStackView:nil];
        _panel.datasource = self;
    }
    return self;
}

- (void)selectionDidChange:(NSArray *)selection {
    self.selection = [selection valueForKey:@"layers"];         // To get NSArray from MSLayersArray

    self.panel.stackView = [(NSObject *)_document valueForKeyPath:@"inspectorController.currentInspector.stackView"];
    [self.panel reloadData];
}

#pragma mark - ___PACKAGENAMEASIDENTIFIER___SketchPanelDataSource

- (___PACKAGENAMEASIDENTIFIER___SketchPanelCell *)headerFor___PACKAGENAMEASIDENTIFIER___SketchPanel:(___PACKAGENAMEASIDENTIFIER___SketchPanel *)panel {
    ___PACKAGENAMEASIDENTIFIER___SketchPanelCellHeader *cell = (___PACKAGENAMEASIDENTIFIER___SketchPanelCellHeader *)[panel dequeueReusableCellForReuseIdentifier:@"header"];
    if ( ! cell) {
        cell = [___PACKAGENAMEASIDENTIFIER___SketchPanelCellHeader loadNibNamed:@"___PACKAGENAMEASIDENTIFIER___SketchPanelCellHeader"];
        cell.reuseIdentifier = @"header";
    }
    cell.titleLabel.stringValue = @"___PACKAGENAMEASIDENTIFIER___";
    return cell;
}

- (NSUInteger)numberOfRowsFor___PACKAGENAMEASIDENTIFIER___SketchPanel:(___PACKAGENAMEASIDENTIFIER___SketchPanel *)panel {
    return self.selection.count;    // Using self.selection as number of rows in the panel
}

- (___PACKAGENAMEASIDENTIFIER___SketchPanelCell *)___PACKAGENAMEASIDENTIFIER___SketchPanel:(___PACKAGENAMEASIDENTIFIER___SketchPanel *)panel itemForRowAtIndex:(NSUInteger)index {
    ___PACKAGENAMEASIDENTIFIER___SketchPanelCellDefault *cell = (___PACKAGENAMEASIDENTIFIER___SketchPanelCellDefault *)[panel dequeueReusableCellForReuseIdentifier:@"cell"];
    if ( ! cell) {
        cell = [___PACKAGENAMEASIDENTIFIER___SketchPanelCellDefault loadNibNamed:@"___PACKAGENAMEASIDENTIFIER___SketchPanelCellDefault"];
        cell.reuseIdentifier = @"cell";
    }

    id layer = self.selection[index];
    cell.titleLabel.stringValue = [layer name];
    cell.imageView.image = [layer valueForKeyPath:@"previewImages.LayerListPreviewUnfocusedImage"];

    return cell;
}

@end
