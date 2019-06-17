//
//  WSMovieController.m
//  StartMovie
//
//  Created by iMac on 16/8/29.
//  Copyright © 2016年 sinfotek. All rights reserved.
//

#import "WSMovieController.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "RootTabBarController.h"
#import <AVKit/AVKit.h>

#import "RootTabBarController.h"
@interface WSMovieController ()
@property (strong, nonatomic) MPMoviePlayerController *player;

@end

@implementation WSMovieController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self SetupVideoPlayer];
}


- (void)SetupVideoPlayer
{
    self.player = [[MPMoviePlayerController alloc] initWithContentURL:_movieURL];
    [self.view addSubview:self.player.view];
    self.player.shouldAutoplay = YES;
    [self.player setControlStyle:MPMovieControlStyleNone];
    self.player.repeatMode = MPMovieRepeatModeOne;
    [self.player.view setFrame:[UIScreen mainScreen].bounds];
    self.player.view.alpha = 0;
    [UIView animateWithDuration:3 animations:^{
        self.player.view.alpha = 1;
        [self.player prepareToPlay];
    }];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackStateChanged) name:MPMoviePlayerLoadStateDidChangeNotification object:nil];

    [self setupLoginView];
}

- (void)setupLoginView
{
    //进入按钮
    UIButton *enterMainButton = [[UIButton alloc] init];
    enterMainButton.layer.borderColor = [UIColor whiteColor].CGColor;
    [enterMainButton setTitle:@"你当真要点它❓不看会视频么" forState:UIControlStateNormal];
    enterMainButton.alpha = 0;
    [self.player.view addSubview:enterMainButton];
    [enterMainButton addTarget:self action:@selector(enterMainAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [enterMainButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.player.view);
        make.bottom.mas_equalTo(self.player.view.mas_bottom).offset(AutoFitCG(-70));
        make.height.mas_equalTo(AutoFitCG(17));
    }];
    
    [UIView animateWithDuration:3.0 animations:^{
        enterMainButton.alpha = 1.0;
    }];
}

#pragma mark - NSNotificationCenter
- (void)playbackStateChanged
{
    MPMoviePlaybackState playbackState = [self.player playbackState];
    if (playbackState == MPMoviePlaybackStateStopped || playbackState == MPMoviePlaybackStatePaused) {
        [self.player play];
    }
}


- (void)enterMainAction:(UIButton *)btn {
//    self.popTextView.whiteViewEndFrame = CGRect.init(x: 20, y: 100, width: ScreenWidth - 40, height: ScreenHeight - 300)
//    self.popTextView.addAnimate()
//    self.popTextView.textStr = message
//    self.popTextView.oneBtn.addTarget(self, action: #selector(self.oneBtn4Click), for: UIControlEvents.touchUpInside)
//    self.popTextView.otherBtn.addTarget(self, action: #selector(self.otherBtn4Click), for: UIControlEvents.touchUpInside)
//    PopTextView *popView = [[PopTextView alloc]init];
//    [popView addAnimate];
//    popView.textStr = @"12345";
    
    
//    SlideWhiteViewSubView *view = [slide]
//    RootTabBarController *rootTabBar = [[RootTabBarController alloc] init];
//    self.view.window.rootViewController = rootTabBar;
}


@end
