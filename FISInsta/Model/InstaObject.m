//
//  InstaObject.m
//  FISInsta
//

//

#import "InstaObject.h"

@implementation InstaObject
-(instancetype)initWithImageUrl:(NSURL *)imageUrl Likes:(NSUInteger)likes HashTages:(NSArray *)hashTags LargeImageUrl:(NSURL *)largeImageUrl{
    
    self = [super init];
    if(self){
        _imageUrl = imageUrl;
        _hashTags = hashTags;
        _likes = likes;
        _largeImageUrl = largeImageUrl;
    }
    return self;
}
@end
