//
//  ATApp.h
//  SciFiQuotes
//
//  Created by Adam Tokarski on 17/06/2024.
//

#import <Foundation/Foundation.h>
#import "ATQuote.h"

NS_ASSUME_NONNULL_BEGIN

@interface ATApp : NSObject

@property NSMutableArray<ATQuote *> *quotes;

- (instancetype)initWithFile: (NSString *)path;
- (void)printQuote;

@end

NS_ASSUME_NONNULL_END
