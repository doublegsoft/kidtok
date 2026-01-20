#import "VideoViewController.h"
#import "VideoModel.h"
#import "VideoCell.h"

@interface VideoViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray<VideoModel *> *videos;
@property (nonatomic, strong) NSIndexPath *currentIndexPath;
@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.itemSize = self.view.bounds.size;
    layout.minimumLineSpacing = 0;

    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.pagingEnabled = YES;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[VideoCell class] forCellWithReuseIdentifier:@"VideoCell"];
    [self.view addSubview:self.collectionView];

    VideoModel *v1 = [VideoModel new];
    v1.videoURL = [NSURL URLWithString:@"https://www.w3schools.com/html/mov_bbb.mp4"];

    VideoModel *v2 = [VideoModel new];
    v2.videoURL = [NSURL URLWithString:@"https://www.w3schools.com/html/movie.mp4"];

    self.videos = @[v1, v2];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.videos.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    VideoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"VideoCell" forIndexPath:indexPath];
    [cell configureWithModel:self.videos[indexPath.item]];
    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.y / scrollView.frame.size.height;
    NSIndexPath *newIndexPath = [NSIndexPath indexPathForItem:index inSection:0];

    if (![newIndexPath isEqual:self.currentIndexPath]) {
        if (self.currentIndexPath) {
            VideoCell *oldCell = (VideoCell *)[self.collectionView cellForItemAtIndexPath:self.currentIndexPath];
            [oldCell pause];
        }
        self.currentIndexPath = newIndexPath;
    }
}
@end
