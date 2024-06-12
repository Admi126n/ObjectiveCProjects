//
//  main.m
//  Hangman
//
//  Created by Adam Tokarski on 12/06/2024.
//

#import <Foundation/Foundation.h>

void printWord(NSString *word, NSMutableArray<NSString*> *usedLetters) {
	
	BOOL missingLetters = NO;
	printf("\nWord: ");
	
	for (NSInteger i = 0; i < [word length]; ++i) {
		unichar letter = [word characterAtIndex:i];
		NSString *letterString = [NSString stringWithFormat:@"%C", letter];
		
		if ([usedLetters containsObject:letterString]) {
			printf("%C", letter);
		} else {
			printf("_");
			missingLetters = YES;
		}
	}
	
	printf("\nGuesses: %ld\n", [usedLetters count]);
	
	if (missingLetters == NO) {
		printf("You won!");
		exit(0);
	} else {
		if ([usedLetters count] == 8) {
			printf("Oops, you died! The word was %s", [word cStringUsingEncoding:NSUTF8StringEncoding]);
			exit(0);
		} else {
			printf("Enter the quess: ");
		}
	}
}

int main(int argc, const char * argv[]) {
	
	NSString *word = @"RYTHM";
	NSMutableArray<NSString*> *usedLetters = [NSMutableArray arrayWithCapacity:8];
	
	printf("Welcome to Hangman game!");
	printf("Press a letter to guess, or Ctrl+C to quit.\n");
	printWord(word, usedLetters);
	
	while (1) {
		// read user input
		char cstring[256];
		scanf("%s", cstring);
		
		// convert input to NSString
		NSString *input = [NSString stringWithCString:cstring encoding:NSUTF8StringEncoding];
		
		if ([input length] != 1) {
			printf("Please type one letter or press Ctrl+C to quit the game.");
		} else {
			// get first letter
			unichar letter = [input characterAtIndex:0];
			
			// convert it to uppercase
			NSString *letterString = [[NSString stringWithFormat:@"%C", letter] uppercaseString];
			
			if ([usedLetters containsObject:letterString]) {
				printf("You've already used this letter!\n");
			} else {
				[usedLetters addObject:letterString];
			}
			
		}
		
		printWord(word, usedLetters);
	}
	
	return 0;
}
