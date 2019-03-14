//
//  DTXRequestsPlaygroundController.h
//  DetoxInstruments
//
//  Created by Leo Natan (Wix) on 3/3/19.
//  Copyright © 2017-2019 Wix. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DTXRequestsPlaygroundController : NSViewController

@property (strong) IBOutlet NSTabView *tabView;

- (void)loadRequestDetailsFromNetworkSample:(DTXNetworkSample*)networkSample;
- (void)loadRequestDetailsFromURLRequest:(NSURLRequest*)request;
- (NSURLRequest*)requestForSaving;

@end
