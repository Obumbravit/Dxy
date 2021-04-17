//Dxy by Obumbravit

//imports
@import UIKit;
#import "Prefs.h"
#import "Dxy.h"
#import "MediaRemote.h"

%hook _UIStatusBarStringView
%property (nonatomic,assign) bool isPlaying;
%property (nonatomic,retain) NSString * playingString;
%property (nonatomic,retain) NSString * time;

- (void)didMoveToWindow
{
    %orig;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateDxy) name:(__bridge NSString *)kMRMediaRemoteNowPlayingInfoDidChangeNotification object:nil];
}

- (void)setText:(NSString *)arg1
{
    if (dxyEnabled)
    {
        if (self.isPlaying) %orig(self.playingString);
        else
        {
            %orig;
            self.time = arg1;
        }
    }
    else %orig;
}

%new
- (void)updateDxy
{
    if (dxyEnabled)
    {
        if (self.fontStyle != 1) return;
        MRMediaRemoteGetNowPlayingInfo(dispatch_get_main_queue(), ^(CFDictionaryRef information)
        {
            NSDictionary * dict=(__bridge NSDictionary *)(information);
            NSString * isTitle = [dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoTitle];
            NSString * trackTitle = (titleEnabled) ? [dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoTitle] : @"DxyFiller";
            NSString * albumTitle = (albumEnabled) ? [dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoAlbum] : @"DxyFiller";
            NSString * trackArtist = (artistEnabled) ? [dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoArtist] : @"DxyFiller";
            NSMutableArray * trackInfo = [[NSMutableArray arrayWithObjects:trackTitle,albumTitle,trackArtist,nil] init];
            [trackInfo removeObjectsInArray:@[@"DxyFiller"]];
            NSString * playingString = [trackInfo componentsJoinedByString:@" - "];
            if (isTitle)
            {
                self.isPlaying = true;
                self.playingString = playingString;
                [self setMarqueeEnabled:YES];
                [self setMarqueeRunning:YES];
                [self setText:playingString];
                if (albumColorEnabled)
                {
                    NSData * artworkData = [dict objectForKey:(__bridge NSString *)kMRMediaRemoteNowPlayingInfoArtworkData];
                    UIImage * nowPlayingArtwork = [UIImage imageWithData:artworkData];
                    [self setTextColor:[%c(Avgct) getDominantColor:nowPlayingArtwork]];
                }
            }
            else
            {
                self.isPlaying = false;
                [self setMarqueeEnabled:NO];
                [self setMarqueeRunning:NO];
                [self setText:self.time];
                if (albumColorEnabled) [self setTextColor:[UIColor whiteColor]];
            }
        });
    }
}

%end


%ctor
{
    notificationCallback(NULL, NULL, NULL, NULL, NULL);
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, notificationCallback, (CFStringRef)nsNotificationString, NULL, CFNotificationSuspensionBehaviorCoalesce);
}