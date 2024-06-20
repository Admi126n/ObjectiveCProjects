//
//  main.m
//  SciFiQuotes
//
//  Created by Adam Tokarski on 17/06/2024.
//

#import <Foundation/Foundation.h>
#import "ATApp.h"

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);
		NSString *desktopPath = [paths objectAtIndex:0];
	
		ATApp *app = [[ATApp alloc] initWithFile:[desktopPath stringByAppendingPathComponent:@"quotes.txt"]];
		[app printQuote];
	}
	return 0;
}
