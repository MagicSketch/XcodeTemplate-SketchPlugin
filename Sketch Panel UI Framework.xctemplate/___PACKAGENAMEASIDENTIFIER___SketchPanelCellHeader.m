//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "___PACKAGENAMEASIDENTIFIER___SketchPanelCellHeader.h"

@implementation ___PACKAGENAMEASIDENTIFIER___SketchPanelCellHeader

- (void)drawRect:(NSRect)frame {
    [super drawRect:frame];

    //// Color Declarations
    NSColor* inspectorSectionHeaderColor = [NSColor colorWithCalibratedRed: 0.973 green: 0.973 blue: 0.973 alpha: 1];
    NSColor* inspectorSectionHeaderColor2 = [NSColor colorWithCalibratedRed: 0.902 green: 0.902 blue: 0.902 alpha: 1];

    //// Gradient Declarations
    NSGradient* inspectorSectionHeader = [[NSGradient alloc] initWithStartingColor: inspectorSectionHeaderColor endingColor: inspectorSectionHeaderColor2];

    //// Rectangle Drawing
    NSBezierPath* rectanglePath = [NSBezierPath bezierPathWithRect: NSMakeRect(NSMinX(frame), NSMinY(frame), NSWidth(frame), NSHeight(frame))];
    [inspectorSectionHeader drawInBezierPath: rectanglePath angle: 0];

}

@end
