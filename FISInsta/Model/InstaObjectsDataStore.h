//
//  InstaObjectsDataStore.h
//  FISInsta
//

//

#import <Foundation/Foundation.h>
#import "InstaObject.h"
#import "UserInfo.h"

@interface InstaObjectsDataStore : NSObject
@property (strong,nonatomic)NSMutableArray *instaObjects;
@property (strong,nonatomic)UserInfo *userInfo;
+(instancetype)sharedInstaObjectDataStore;
@end
