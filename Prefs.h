@interface NSUserDefaults (dxyprefs)
- (id)objectForKey:(NSString *)key inDomain:(NSString *)domain;
- (void)setObject:(id)value forKey:(NSString *)key inDomain:(NSString *)domain;
@end

static NSString * nsDomainString = @"com.obumbravit.dxy";
static NSString * nsNotificationString = @"com.obumbravit.dxy/preferences.changed";

static BOOL dxyEnabled;
static BOOL titleEnabled;
static BOOL albumEnabled;
static BOOL artistEnabled;
static BOOL albumColorEnabled;

static void notificationCallback(CFNotificationCenterRef center, void * observer, CFStringRef name, const void * object, CFDictionaryRef userInfo)
{
    NSNumber * dxyEnabledd = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"dxyEnabled" inDomain:nsDomainString];
    NSNumber * titleEnabledd = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"titleEnabled" inDomain:nsDomainString];
    NSNumber * albumEnabledd = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"albumEnabled" inDomain:nsDomainString];
    NSNumber * artistEnabledd = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"artistEnabled" inDomain:nsDomainString];
    NSNumber * albumColorEnabledd = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"albumColorEnabled" inDomain:nsDomainString];

    dxyEnabled = (dxyEnabledd) ? [dxyEnabledd boolValue] : YES;
    titleEnabled = (titleEnabledd) ? [titleEnabledd boolValue] : YES;
    albumEnabled = (albumEnabledd) ? [albumEnabledd boolValue] : NO;
    artistEnabled = (artistEnabledd) ? [artistEnabledd boolValue] : NO;
    albumColorEnabled = (albumColorEnabledd) ? [albumColorEnabledd boolValue] : NO;
}