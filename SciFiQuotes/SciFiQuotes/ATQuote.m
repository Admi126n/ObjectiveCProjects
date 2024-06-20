//
//  ATQuote.m
//  SciFiQuotes
//
//  Created by Adam Tokarski on 17/06/2024.
//

#import "ATQuote.h"

@implementation ATQuote

- (nonnull instancetype)initWithLine:(nonnull NSString *)line {
	if (self = [super init]) {
		NSArray<NSString *> *components = [line componentsSeparatedByString:@"/"];
		
		self.quote = components[0];
		self.author = components[1];
	}
	
	return self;
}

@end
