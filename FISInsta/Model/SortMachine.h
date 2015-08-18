//
//  SortMachine.h
//  FISInsta
//

//

#import <Foundation/Foundation.h>

@interface SortMachine : NSObject
-(NSArray *)sortByLikesHighToLow;
-(NSArray *)sortByLikesLowToHigh;
-(NSArray *)sortByHashTagCount;

@end
