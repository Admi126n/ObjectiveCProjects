//
//  ATApp.m
//  SciFiQuotes
//
//  Created by Adam Tokarski on 17/06/2024.
//

#import "ATApp.h"

@implementation ATApp

- (instancetype)initWithFile:(NSString *)path {
	if (self = [super init]) {
		NSString *fileContents = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
		
		NSArray<NSString *> *lines = [fileContents componentsSeparatedByString:@"\n"];
		self.quotes = [self getQuotesFromLines:lines];
	}
	
	return self;
}

- (nonnull NSArray<ATQuote *> *)getQuotesFromLines:(nonnull NSArray<NSString *> *)lines {
	NSMutableArray<ATQuote *> *quotes = [[NSMutableArray alloc] initWithCapacity:6];
	
	for (NSString *line in lines) {
		ATQuote *quote = [[ATQuote alloc] initWithLine:line];
		[quotes addObject:quote];
	}
	
	return quotes;
}

- (void)printQuote {
	NSInteger rand = arc4random_uniform((uint32_t)[self.quotes count]);
	ATQuote *randomQuote = self.quotes[rand];
	
	NSLog(@"%@ once said: %@", randomQuote.author, randomQuote.quote);
}

@end
