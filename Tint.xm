#define kColor [UIColor colorWithRed:1.00 green:0.25 blue:0.00 alpha:1.0];
#define kDarkColor [UIColor colorWithRed:0.09 green:0.09 blue:0.09 alpha:1.0];
#define kLightGrayColor [UIColor colorWithRed:0.70 green:0.70 blue:0.70 alpha:1.0];
#define kGrayColor [UIColor colorWithRed:0.30 green:0.30 blue:0.30 alpha:1.0];
#define kDarkishGrayColor [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0];
#define kDarkTranslucentColor [UIColor colorWithRed:0.09 green:0.09 blue:0.09 alpha:0.85];
#define kLighterDarkColor [UIColor colorWithRed:0.11 green:0.11 blue:0.11 alpha:1.0];

#import "Headers/ANEMWebImageButton.h"

@interface __FakeMarqueeLabel : UILabel
@property(nonatomic, retain) UIColor *textColor;
@property(nonatomic, copy) NSString *text;
@end

@interface SourceProgressIndicatorView : UIView
@end

%hook UIImageView
-(void)_setDefaultRenderingMode:(long long)arg1{
	if([self.superview isKindOfClass:NSClassFromString(@"ANEMWebImageButton")]){
		arg1 = 2;
		%orig(arg1);
	}
	%orig(arg1);
}
-(void)setTintColor:(UIColor *)arg1{
	if([self.superview isKindOfClass:NSClassFromString(@"ANEMWebImageButton")]){
		arg1 = [UIColor blueColor];
		%orig(arg1);
	}
	%orig(arg1);
}
%end
%hook UITableView
-(void)setSeparatorColor:(UIColor *)arg1{
    arg1 = kColor;
    %orig(arg1);
}
%end
%hook UINavigationBar
-(void)setTintColor:(UIColor *)arg1{
	arg1 = kColor;
	%orig(arg1);
}
%end
%hook UINavigationButton
-(void)setTintColor:(UIColor *)arg1{
    arg1 = kColor;
    %orig(arg1);
}
%end
%hook UISegmentedControl
-(void)setTintColor:(UIColor *)arg1{
	arg1 = kColor;
	%orig(arg1);
}
%end
%hook SourceProgressIndicatorView
-(void)setTintColor:(UIColor *)arg1 {
    arg1 = kColor;
    %orig(arg1);
}
%end
%hook UITabBar
-(void)setTintColor:(UIColor *)arg1{
	arg1 = kColor;
	%orig(arg1);
}
%end
%hook PackageQueueButton
-(void)setBackgroundColor:(id)arg1{
	arg1 = kColor;
	%orig(arg1);
}
%end
%hook FeaturedButton
-(void)setTitleColor:(id)arg1 forState:(unsigned long long)arg2 {
	arg1 = kColor;
	%orig(arg1, arg2);
}
%end
%hook DownloadConfirmButton
-(void)setBackgroundColor:(id)arg1{
	arg1 = kColor;
	%orig(arg1);
}
%end
%hook __FakeMarqueeLabel
-(void)_setTextColor:(id)arg1{
    if ([self.text containsString:@"Package"]) {
        arg1 = kLightGrayColor;
        %orig(arg1);
    } else {
        %orig(arg1);
    }
}
%hook UIButton
-(void)setTitleColor:(id)arg1 forState:(unsigned long long)arg2 {
	arg1 = kColor;
	%orig(arg1, arg2);
}
%end
%hook DepictionTableButtonView
-(void)layoutSubviews {
    %orig;
    if ([self valueForKey:@"_titleLabel"]){
        UILabel *titleLabel = (UILabel *)[self valueForKey:@"_titleLabel"];
        titleLabel.textColor = kColor;
    }
}
%end
@interface DepictionTabControl : UIView
@property(nonatomic) _Bool highlighted; 
@end
%hook DepictionTabControl
- (void)layoutSubviews {
	%orig;
	if (self.highlighted){
		if ([self valueForKey:@"_tabLabel"]) {
			UILabel *tabLabel = (UILabel *)[self valueForKey:@"_tabLabel"];
        	tabLabel.textColor = kColor;
    	}
	}
}
%end
%hook DepictionTabView
-(void)layoutSubviews {
	%orig;
	if ([self valueForKey:@"_tabViewHighlight"]) {
		UIView *tabViewHighlight = (UIView *)[self valueForKey:@"_tabViewHighlight"];
        tabViewHighlight.backgroundColor = kColor;
    }
}
%end 
%hook UITabBarButton //This sets the color for any badge that belongs to a TabBarIcon.
-(void)layoutSubviews{
    %orig;
    UIView *badge = MSHookIvar<UIView*>(self, "_badge");
    badge.backgroundColor = kColor;
}
%end