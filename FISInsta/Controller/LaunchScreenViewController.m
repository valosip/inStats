//
//  LaunchScreenViewController.m
//  FISInsta
//
//

#import "LaunchScreenViewController.h"
#import "SKSplashIcon.h"
#import "UserInfoTableViewController.h"

@interface LaunchScreenViewController ()
@property (strong, nonatomic) SKSplashView *splashView;

@end

@implementation LaunchScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //if test passed, try call this method
    
    [self launchScreenSplash];
    
    

    
    // Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated{
    [self performSelector:@selector(push) withObject:nil afterDelay:1.5];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)push{
    [self performSegueWithIdentifier:@"LaunchScreen" sender:self];
    

}

- (void) launchScreenSplash
{
    //    //Setting the background
    //    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    //    imageView.image = [UIImage imageNamed:@"twitter background.png"];
    //    [self.view addSubview:imageView];
    //Twitter style splash
    SKSplashIcon *FISInstaSplashIcon = [[SKSplashIcon alloc] initWithImage:[UIImage imageNamed:@"appicon"] animationType:SKIconAnimationTypeBounce];
//    UIColor *FISInstaColor = [UIColor colorWithRed:0.25098 green:0.6 blue:1.0 alpha:1.0];
    UIColor * FISInstaColor = [UIColor colorWithRed:238/255.0f green:238/255.0f blue:238/255.0f alpha:1.0f];
    _splashView = [[SKSplashView alloc] initWithSplashIcon:FISInstaSplashIcon backgroundColor:FISInstaColor animationType:SKSplashAnimationTypeNone];
    _splashView.animationDuration = 3; //Optional -> set animation duration. Default: 1s
    [self.view addSubview:_splashView];
    [_splashView startAnimation];
    
    
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    NSLog(@"%@", segue.destinationViewController);
    UITabBarController *tabBar = segue.destinationViewController;
    [tabBar setSelectedIndex:3];
    
    NSLog(@"Getting called?");
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
