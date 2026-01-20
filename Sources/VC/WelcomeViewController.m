/*
** ██╗░░██╗██╗██████╗░████████╗░█████╗░██╗░░██╗
** ██║░██╔╝██║██╔══██╗╚══██╔══╝██╔══██╗██║░██╔╝
** █████═╝░██║██║░░██║░░░██║░░░██║░░██║█████═╝░
** ██╔═██╗░██║██║░░██║░░░██║░░░██║░░██║██╔═██╗░
** ██║░╚██╗██║██████╔╝░░░██║░░░╚█████╔╝██║░╚██╗
** ╚═╝░░╚═╝╚═╝╚═════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝
*/
#import "AppDelegate.h"
#import "WelcomeViewController.h"

#import "GUX/Common/GUX.h"

@interface WelcomeViewController ()

/*!
** swiper control
*/
@property (nonatomic, strong) UIScrollView* scrollView;

/*!
** page indicator
*/
@property (nonatomic, strong) UIPageControl* pageControl;

@end

@implementation WelcomeViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  
  // Initialize the scroll view
  self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
  self.scrollView.pagingEnabled = YES;
  self.scrollView.showsHorizontalScrollIndicator = NO;
  self.scrollView.delegate = self;
  
  // Add content to the scroll view
  [self addContentToScrollView];
  
  // Add the scroll view to the main view
  [self.view addSubview:self.scrollView];
}

- (void)addContentToScrollView {
  CGFloat width = self.view.bounds.size.width;
  CGFloat height = self.view.bounds.size.height;
  
  CGFloat imageWidth = 300;
  CGFloat imageHeight = 300;
  CGFloat x = ([GUX screenWidth] - imageWidth) / 2;
  CGFloat y = ([GUX screenHeight] - imageHeight) / 3;
  
}

- (IBAction)gotoMainView:(UIButton *)sender {

}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
  CGFloat pageWidth = scrollView.frame.size.width;
  NSInteger page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
  self.pageControl.currentPage = page;
}

@end
