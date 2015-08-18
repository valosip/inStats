//
//  HashTagTableViewController.m
//  FISInsta
//
//

#import "HashTagTableViewController.h"
#import "SortMachine.h"
#import "HashTagObject.h"
#import "HashTagDetailsTableViewController.h"
#import "GetInstaData.h"
#import "InstaObjectsDataStore.h"


@interface HashTagTableViewController ()
@property (nonatomic, strong) NSArray *hashTagObjects;
@property (nonatomic, strong) SortMachine *machine;
@property (strong, nonatomic) InstaObjectsDataStore *dataStore;
@end

@implementation HashTagTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self prepareToRock];
    
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    [self prepareToRock];
    [self.tableView reloadData];
    
    NSLog(@"HELOOOOOOOOOO");
}

-(void)prepareToRock{
    self.dataStore = [InstaObjectsDataStore sharedInstaObjectDataStore];
    
    self.machine = [[SortMachine alloc]init];
    
    self.hashTagObjects = [self.machine sortByHashTagCount];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}
- (IBAction)refreshTriggered:(id)sender {
    GetInstaData *data = [[GetInstaData alloc]initWithUserToken:self.dataStore.userInfo.userToken];
    [data getDataStoreReadyWithCompletion:^{
        [self prepareToRock];
        [self.tableView reloadData];
        [self.refreshControl endRefreshing];
    }];
    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.hashTagObjects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseHashCell" forIndexPath:indexPath];
    
    // Configure the cell...
    HashTagObject * hashInfo = self.hashTagObjects[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"#%@",hashInfo.hashTagName ];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu images", (unsigned long)hashInfo.count];
    return cell;
}


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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    UITableViewCell *cell = sender;
    NSInteger index = [self.tableView indexPathForCell:cell].row;
    HashTagObject *object = self.hashTagObjects[index];
    HashTagDetailsTableViewController *destinationController = segue.destinationViewController;
    destinationController.InstaObjectArray = object.instaObjectArrayWithSameHashTag;
}


@end
