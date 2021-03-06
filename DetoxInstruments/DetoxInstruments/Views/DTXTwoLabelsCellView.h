//
//  DTXTwoLabelsCellView.h
//  DetoxInstruments
//
//  Created by Leo Natan (Wix) on 4/16/18.
//  Copyright © 2017-2021 Wix. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DTXTwoLabelsCellView : NSTableCellView

@property (nullable, assign) IBOutlet NSTextField *detailTextField;
@property (nullable, weak) IBOutlet NSButton* moreInfoButton;

@end
