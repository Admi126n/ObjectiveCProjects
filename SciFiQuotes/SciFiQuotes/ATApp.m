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
		NSError *error;
		
		NSString *fileContents = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
		
		if (error != nil) {
			NSLog(@"Something went wrong");
			exit(0);
		}
		
		NSArray<NSString *> *lines = [fileContents componentsSeparatedByString:@"\n"];
		
		self.quotes = [NSMutableArray arrayWithCapacity:[lines count]];
		[self getQuotesFromLines:lines];
	}
	
	return self;
}

- (void)getQuotesFromLines:(nonnull NSArray<NSString *> *)lines {
	for (NSString *line in lines) {
		ATQuote *quote = [[ATQuote alloc] initWithLine:line];
		
		if (quote != nil) {
			[self.quotes addObject:quote];
		}
	}
}

- (void)printQuote {
	NSInteger rand = arc4random_uniform((uint32_t)[self.quotes count]);
	ATQuote *randomQuote = self.quotes[rand];
	
	NSLog(@"%@ once said: %@", randomQuote.author, randomQuote.quote);
}

@end
