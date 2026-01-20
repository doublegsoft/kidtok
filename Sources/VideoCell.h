#import <UIKit/UIKit.h>
#import "VideoModel.h"

@interface VideoCell : UICollectionViewCell
- (void)configureWithModel:(VideoModel *)model;
- (void)pause;
@end
