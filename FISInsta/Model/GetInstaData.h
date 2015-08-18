//
//  GetInstaData.h
//  FISInsta
//

//

#import <Foundation/Foundation.h>



@interface GetInstaData : NSObject
-(instancetype)initWithUserToken:(NSString *)userToken;


//-(void)getInstaObjs;
//-(void)getJsonDictionary;
-(void)getDataStoreReadyWithCompletion:(void (^)(void))completionBlock;

@end
