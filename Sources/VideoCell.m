#import "VideoCell.h"
#import <AVFoundation/AVFoundation.h>

@interface VideoCell ()
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerLayer *playerLayer;
@end

@implementation VideoCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.playerLayer = [AVPlayerLayer layer];
        self.playerLayer.frame = self.contentView.bounds;
        self.playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        [self.contentView.layer addSublayer:self.playerLayer];
    }
    return self;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    [self.player pause];
    self.player = nil;
}

- (void)configureWithModel:(VideoModel *)model {
    self.player = [AVPlayer playerWithURL:model.videoURL];
    self.playerLayer.player = self.player;
    [self.player play];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(loopVideo)
                                                 name:AVPlayerItemDidPlayToEndTimeNotification
                                               object:self.player.currentItem];
}

- (void)pause {
    [self.player pause];
}

- (void)loopVideo {
    [self.player seekToTime:kCMTimeZero];
    [self.player play];
}
@end
