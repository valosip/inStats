//
//  UserInfo.h
//  FISInsta
//

//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject
@property (strong,nonatomic)NSString *userName;
@property (strong,nonatomic)NSURL *profilePic;
@property (strong,nonatomic)NSString *fullName;
@property (nonatomic) NSUInteger totalLikes;
@property (strong,nonatomic) NSMutableSet *hashtagSet;
@property (strong,nonatomic) NSString *userToken;
@end
