//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import <Foundation/Foundation.h>
#import "___PACKAGENAMEASIDENTIFIER___.h"
#import <CocoaScript/COScript.h>
#import "___PACKAGENAMEASIDENTIFIER___SketchPanelController.h"
@import JavaScriptCore;
#import <Mocha/Mocha.h>
#import <Mocha/MOClosure.h>
#import <Mocha/MOJavaScriptObject.h>
#import <Mocha/MochaRuntime_Private.h>


@interface ___PACKAGENAMEASIDENTIFIER___ : NSObject

@property (nonatomic, strong) ___PACKAGENAMEASIDENTIFIER___SketchPanelController *panelController;
@property (nonatomic, strong) id <___PACKAGENAMEASIDENTIFIER___MSDocument> document;
@property (nonatomic, copy) NSString *panelControllerClassName;

+ (instancetype)onSelectionChanged:(id)context;
- (void)onSelectionChange:(NSArray *)selection;
+ (void)setSharedCommand:(id)command;

@end



@implementation ___PACKAGENAMEASIDENTIFIER___

static id _command;

+ (void)setSharedCommand:(id)command {
    _command = command;
}

+ (id)sharedCommand {
    return _command;
}

+ (instancetype)onSelectionChanged:(id)context {

//    COScript *coscript = [COScript currentCOScript];

    id <___PACKAGENAMEASIDENTIFIER___MSDocument> document = [context valueForKeyPath:@"actionContext.document"];
    if ( ! [document isKindOfClass:NSClassFromString(@"MSDocument")]) {
        document = nil;  // be safe
        return nil;
    }

    if ( ! [self sharedCommand]) {
        [self setSharedCommand:[context valueForKeyPath:@"command"]]; // MSPluginCommand
    }

    NSString *key = [NSString stringWithFormat:@"%@-___PACKAGENAMEASIDENTIFIER___", [document description]];
    __block ___PACKAGENAMEASIDENTIFIER___ *instance = [[Mocha sharedRuntime] valueForKey:key];

    if ( ! instance) {
//        [coscript setShouldKeepAround:YES];
        instance = [[self alloc] initWithDocument:document];
        [[Mocha sharedRuntime] setValue:instance forKey:key];
    }

    NSArray *selection = [context valueForKeyPath:@"actionContext.document.selectedLayers"];
//    NSLog(@"selection %p %@ %@", instance, key, selection);
    [instance onSelectionChange:selection];
    return instance;
}

- (instancetype)initWithDocument:(id <___PACKAGENAMEASIDENTIFIER___MSDocument>)document {
    if (self = [super init]) {
        _document = document;
        _panelController = [[___PACKAGENAMEASIDENTIFIER___SketchPanelController alloc] initWithDocument:_document];
    }
    return self;
}

- (void)onSelectionChange:(NSArray *)selection {
    [_panelController selectionDidChange:selection];
}

@end
