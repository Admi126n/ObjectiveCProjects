//
//  ATQuote.h
//  SciFiQuotes
//
//  Created by Adam Tokarski on 17/06/2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ATQuote : NSObject

@property NSString* quote;
@property NSString* author;

- (instancetype)initWithLine: (NSString *)line;

@end

NS_ASSUME_NONNULL_END
