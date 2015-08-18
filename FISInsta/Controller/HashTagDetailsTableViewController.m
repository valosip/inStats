//
//  HashTagDetailsTableViewController.m
//  FISInsta
//
//

#import "HashTagDetailsTableViewController.h"
#import "sortLikesTableViewCell.h"
#import "InstaObject.h"
#import "ImageDetailTableViewController.h"
@interface HashTagDetailsTableViewController ()

@end

@implementation HashTagDetailsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.InstaObjectArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    sortLikesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseHashTagDetailCell" forIndexPath:indexPath];
    InstaObject *object = self.InstaObjectArray[indexPath.row];
    cell.likesLabel.text = [NSString stringWithFormat:@"%lu ♥'s",object.likes];
    cell.imageViewDisplay.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:object.imageUrl]];
    cell.imageViewDisplay.layer.masksToBounds = YES;
    cell.imageViewDisplay.layer.cornerRadius = 10;
    cell.imageViewDisplay.layer.borderWidth = 0;
    cell.imageViewDisplay.layer.borderColor = [[UIColor whiteColor] CGColor];
    
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
    sortLikesTableViewCell *cell = sender;
    NSInteger index = [self.tableView indexPathForCell:sender].row;
    InstaObject *object = self.InstaObjectArray[index];
    ImageDetailTableViewController *destinationController = segue.destinationViewController;
    destinationController.instaObject = object;
}


@end
