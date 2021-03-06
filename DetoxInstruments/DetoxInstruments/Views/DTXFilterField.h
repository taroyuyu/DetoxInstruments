//
//  DTXFilterField.h
//  DetoxInstruments
//
//  Created by Artal Druk on 28/08/2017.
//  Copyright © 2017-2021 Wix. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class DTXFilterField;

@protocol DTXFilterFieldDelegate

- (void)filterFieldTextDidChange:(DTXFilterField*)filterField;

@end

@interface DTXFilterField : NSSearchField <NSSearchFieldDelegate>

@property (nonatomic, weak) id<DTXFilterFieldDelegate> filterDelegate;

- (void)clearFilter;

@end
