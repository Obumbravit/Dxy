@interface _UIStatusBarStringView : UILabel
@property (nonatomic, assign) long long fontStyle;
@property (nonatomic,assign) bool isPlaying;
@property (nonatomic,retain) NSString * playingString;
@property (nonatomic,retain) NSString * time;
- (void)setText:(NSString *)arg1;
- (void)setMarqueeEnabled:(BOOL)arg1;
- (void)setMarqueeRunning:(BOOL)arg1;
@end

@interface Avgct
+ (UIColor *)getDominantColor:(UIImage*)image;
+ (NSDictionary*)mainColoursInImage:(UIImage *)image detail:(int)detail;
@end
