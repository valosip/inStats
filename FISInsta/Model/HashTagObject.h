//
//  HashTagObject.h
//  FISInsta
//

//

#import <Foundation/Foundation.h>

@interface HashTagObject : NSObject
@property (strong,nonatomic) NSString *hashTagName;
@property (strong,nonatomic) NSArray *instaObjectArrayWithSameHashTag;
@property (nonatomic) NSUInteger count;

-(instancetype)initWithName:(NSString *)name InstaObjectsWithSameHashTag:(NSMutableArray *)instaObjectArrayWithSameHashTag;
@end
