//
//  ViewController.m
//  flyTravel
//
//  Created by user179996 on 20.06.2021.
//

#import "MainViewController.h"
#import "DataManager.h"
#import "SecondViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[DataManager sharedInstance] loadData];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadDidCompleted) name:kDataManagerLoadDataIsCompleted object:nil];
    
    self.view.backgroundColor = UIColor.blueColor;
       
    UIButton *countriesButton = [[UIButton alloc] initWithFrame:CGRectMake(60, 300, 150, 50)];
    countriesButton.backgroundColor = UIColor.blueColor;
    [countriesButton setTitle:@"County" forState: UIControlStateNormal];
    countriesButton.tintColor = [UIColor blackColor];
    [countriesButton addTarget: self action: @selector(changeLabelText:) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: countriesButton];
    
    UIButton *citiesButton = [[UIButton alloc] initWithFrame:CGRectMake(60, 400, 150, 50)];
    citiesButton.backgroundColor = UIColor.blackColor;
    [citiesButton setTitle:@"City" forState: UIControlStateNormal];
    countriesButton.tintColor = [UIColor whiteColor];
    [citiesButton addTarget: self action: @selector(changeLabelText:) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: citiesButton];
    
    
    UIBarButtonItem *buttonizeButton = [[UIBarButtonItem alloc] initWithTitle:@"Second ViewController"
                                                                        style:UIBarButtonItemStyleDone
                                                                       target:self
                                                                       action:@selector(buttonizeButtonTap:)];
    self.navigationItem.rightBarButtonItems = @[buttonizeButton];
    
}

- (void) changeLabelText: (UIButton *) sender {
    
    UILabel *myLabel = [[UILabel alloc] initWithFrame: CGRectMake(50, 500, 150, 30)];
    myLabel.text = @"New Label";
    [self.view addSubview: myLabel];
}

-(void)buttonizeButtonTap:(id)sender{
    SecondViewController *next = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:next animated:YES];
    }

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}

- (void) loadDidCompleted {
    self.view.backgroundColor = UIColor.greenColor;
}

@end
