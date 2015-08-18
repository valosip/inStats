//
//  ImageDetailTableViewController.m
//  FISInsta
//
//

#import "ImageDetailTableViewController.h"
#import "UIScrollView+APParallaxHeader.h"

@interface ImageDetailTableViewController ()
@property (weak, nonatomic) IBOutlet UILabel *hashTagLabel;
@property (weak, nonatomic) IBOutlet UILabel *LikeLabel;

@end

@implementation ImageDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *imageToDisplay = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.instaObject.largeImageUrl]];
    [self.tableView addParallaxWithImage:imageToDisplay andHeight:300];
//    self.largeImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.instaObject.largeImageUrl]];
    self.LikeLabel.text = [NSString stringWithFormat:@"%lu ♥'s", self.instaObject.likes];
    NSMutableString *hashTagSumUp = [[NSMutableString alloc]init];
    for(NSString *hashtag in self.instaObject.hashTags){
        NSString *hashTagToAdd = [NSString stringWithFormat:@"#%@ ",hashtag];
        [hashTagSumUp appendString:hashTagToAdd];
    }
    self.hashTagLabel.text = hashTagSumUp;
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
