//
//  ThirdVC.m
//  AGGeometryKitUseDemo
//
//  Created by hunuo on 2018/1/31.
//  Copyright © 2018年 fhc. All rights reserved.
//

#import "ThirdVC.h"
#import "MyDrawView.h"
#import "MyDrawView2.h"
#import "MyDrawView3.h"
#import "MyBrushView.h"

@interface ThirdVC ()

@property (nonatomic, retain) MyDrawView * view1;
@property (nonatomic, retain) MyDrawView2 * view2;
@property (nonatomic, retain) MyDrawView3 * view3;
@property (nonatomic, retain) MyBrushView * view4;

@end

@implementation ThirdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self createUI];
    
//    [self createDarwUI];
    [self createBrushView];
}

- (void)createBrushView {
    
    self.view4 = [[MyBrushView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.view4];
}

- (void)createDarwUI {
    
    self.view3 = [[MyDrawView3 alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.view3];
}

- (void)createUI {
    self.view1 = [[MyDrawView alloc] initWithFrame:CGRectMake(50, 50, 300, 200)];
    [self.view addSubview:self.view1];
    
    
    self.view2 = [[MyDrawView2 alloc] initWithFrame:CGRectMake(50, 300, 300, 200)];
    [self.view addSubview:self.view2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
