//
//  SCApp.m
//  SwiftyCommits
//
//  Created by Adam Tokarski on 25/06/2024.
//

#import "SCApp.h"

@implementation SCApp

- (void)fetchCommitsForRepo:(nonnull NSString *)repo {
	NSString *urlString = [NSString stringWithFormat:@"https://api.github.com/repos/%@/commits", repo];
	NSURL *url = [NSURL URLWithString:urlString];
	NSError *error;
	
	NSData *data = [NSData dataWithContentsOfURL:url options:NSDataReadingUncached error:&error];
	
	if (error != nil) {
		NSLog(@"Something went wrong: %@", [error localizedDescription]);
		exit(0);
	}
	
	NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
	
	if (error != nil) {
		NSLog(@"Something went wrong: %@", [error localizedDescription]);
		exit(0);
	}
	
	for (NSDictionary *entry in json) {
		NSString *name = entry[@"commit"][@"author"][@"name"];
		NSString *message = entry[@"commit"][@"message"];
		
		message = [message stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
		
		printf("%s: %s\n\n", [name cStringUsingEncoding:NSUTF8StringEncoding], [message cStringUsingEncoding:NSUTF8StringEncoding]);
	}
}

@end
