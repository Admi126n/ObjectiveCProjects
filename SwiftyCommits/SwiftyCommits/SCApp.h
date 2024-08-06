//
//  SCApp.h
//  SwiftyCommits
//
//  Created by Adam Tokarski on 25/06/2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SCApp : NSObject
- (void)fetchCommitsForRepo: (NSString *)repo;
@end

NS_ASSUME_NONNULL_END
