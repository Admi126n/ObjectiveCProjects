//
//  main.m
//  SwiftyCommits
//
//  Created by Adam Tokarski on 25/06/2024.
//

#import <Foundation/Foundation.h>
#import "SCApp.h"

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		NSString *repo = @"Admi126n\ElectroBodyRemake";
		
		if (argc == 2) {
			repo = [NSString stringWithCString:argv[1] encoding:NSUTF8StringEncoding];
		}
		
		SCApp *app = [SCApp new];
		[app fetchCommitsForRepo:repo];
	}
	return 0;
}
