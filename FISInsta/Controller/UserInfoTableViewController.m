//
//  UserInfoTableViewController.m
//  FISInsta
//
//

#import "UserInfoTableViewController.h"
#import "GetInstaData.h"
#import "InstaObjectsDataStore.h"
#import <InstagramSimpleOAuth.h>
#import "SortMachine.h"

@interface UserInfoTableViewController ()
@property (strong,nonatomic) InstaObjectsDataStore *dataStore;
@property (strong,nonatomic) NSString *userToken;
@property (weak, nonatomic) IBOutlet UIImageView *userImageDisplay;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalNumberOfUserPosts;
@property (weak, nonatomic) IBOutlet UILabel *totalNumberOfHashtagsUsed;
@property (weak, nonatomic) IBOutlet UILabel *totalNumberOfLikes;

@end

@implementation UserInfoTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    

}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    self.dataStore = [InstaObjectsDataStore sharedInstaObjectDataStore];
    if (!self.dataStore.userInfo.userToken) {
        [self login];
    }
    [self updateUI];
}





-(void)updateUI
{
//    SortMachine *machine = [[SortMachine alloc]init];
//    NSArray *array = [machine sortByLikesHighToLow];
    self.userNameLabel.text = [NSString stringWithFormat:@"%@",self.dataStore.userInfo.userName];
    self.userImageDisplay.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.dataStore.userInfo.profilePic]];
    self.userImageDisplay.layer.masksToBounds = YES;
    self.userImageDisplay.layer.cornerRadius = self.userImageDisplay.frame.size.height/2;
    self.userImageDisplay.layer.borderWidth = 0;
    self.userImageDisplay.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.totalNumberOfUserPosts.text = [NSString stringWithFormat:@"%lu 🎑",(unsigned long)self.dataStore.instaObjects.count];
    self.totalNumberOfHashtagsUsed.text = [NSString stringWithFormat:@"%lu #⃣", (unsigned long)self.dataStore.userInfo.hashtagSet.count];
    self.totalNumberOfLikes.text =[NSString stringWithFormat:@"%lu ♥",(unsigned long)self.dataStore.userInfo.totalLikes];
}
-(void)login{
    
    InstagramSimpleOAuthViewController*viewController =
    [[InstagramSimpleOAuthViewController alloc] initWithClientID:@"3be1650732ff4b45b1887c3b333994ed"
                                                    clientSecret:@"68cf1c07835d49908ddffbd94580dde9"
                                                    callbackURL:[NSURL URLWithString:@"http://fis.valosip.com"]
                                                    completion:^(InstagramLoginResponse *response, NSError *error) {
                                                        NSLog(@"My Access Token is: %@", response.accessToken);
                                                        self.dataStore.userInfo.userToken = response.accessToken;
                                                        self.userImageDisplay.image = [UIImage imageNamed:@"Doge"];
                                                        GetInstaData *data = [[GetInstaData alloc]initWithUserToken:self.dataStore.userInfo.userToken];
                                                        [data getDataStoreReadyWithCompletion:^{
                                                            
                                                            [self updateUI];
                                                        }];
                                                        
    }];

    [self presentViewController:viewController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//
//    if ([segue.identifier isEqualToString: @"jim"]) {
//
//
//    }
//

//    InstagramSimpleOAuthViewController*viewController = segue.destinationViewController;
//    viewController = [[InstagramSimpleOAuthViewController alloc] initWithClientID:@"3be1650732ff4b45b1887c3b333994ed"
//            clientSecret:@"68cf1c07835d49908ddffbd94580dde9"
//             callbackURL:[NSURL URLWithString:@"http://fis.valosip.com"]
//              completion:^(InstagramLoginResponse *response, NSError *error) {
//                    NSLog(@"My Access Token is: %@", response.accessToken);
//                    self.dataStore.userInfo.userToken = response.accessToken;
//              }];

//}


#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
