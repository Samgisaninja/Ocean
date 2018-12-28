#define kDarkColor [UIColor colorWithRed:0.09 green:0.09 blue:0.09 alpha:1.0];
#define kLightGrayColor [UIColor colorWithRed:0.70 green:0.70 blue:0.70 alpha:1.0];
#define kGrayColor [UIColor colorWithRed:0.30 green:0.30 blue:0.30 alpha:1.0];
#define kDarkishGrayColor [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0];
#define kDarkTranslucentColor [UIColor colorWithRed:0.09 green:0.09 blue:0.09 alpha:0.85];
#define kLighterDarkColor [UIColor colorWithRed:0.11 green:0.11 blue:0.11 alpha:1.0];

@interface FeaturedPackageView : UIView
-(void)touchesBegan:(id)arg1 withEvent:(id)arg2;
@end

@interface SourcesTableViewCell : UIView
@end

@interface FeaturedButton : UIButton
@end

@interface FeaturedBannersView : UIView
@end

@interface DepictionTabView : UIView
@end

@interface DepictionTableTextView : UIView
@end

@interface DepictionHeaderView : UIView
@end

@interface DepictionSubheaderView : UIView
@end

@interface FeaturedHeaderView : UIView
@end

@interface PackageViewController : UIViewController
@end

@interface FeaturedViewController : UIViewController
@end

@interface SourcesViewController : UIViewController
@end

@interface FeaturedAutoStackView : UIView
@end

@interface _UINavigationBarContentView : UIView
@end

@interface _UINavigationBarLargeTitleView : UIView
@end

@interface NewsViewController : UIViewController
@end

@interface CSTextRenderView : UIView {
        NSAttributedString *_attributedText;
}
@end

@interface _UIButtonBarStackView : UIView
@end

@interface __FakeMarqueeLabel : UILabel
@end

%hook UICollectionView
-(void)layoutSubviews {
    %orig;
    self.backgroundColor = kDarkColor;
}
%end
%hook DepictionHeaderView
-(void)layoutSubviews {
    %orig;
    if ([self valueForKey:@"_headerLabel"]){
        UILabel *headerLabel = (UILabel *)([self valueForKey:@"_headerLabel"]);
        headerLabel.textColor = [UIColor whiteColor];
    }
}
%end
%hook DepictionTabView
-(void)layoutSubviews {
    %orig;
    self.backgroundColor = kDarkColor;
}
%end
%hook DepictionSubheaderView
-(void)layoutSubviews {
    %orig;
    if ([self valueForKey:@"_headerLabel"]){
        UILabel *headerLabel = (UILabel *)([self valueForKey:@"_headerLabel"]);
        headerLabel.textColor = [UIColor whiteColor];
    }
    self.backgroundColor = kDarkColor;
}
%end
%hook DepictionTableTextView
-(void)layoutSubviews{
    %orig;
    if ([self valueForKey:@"_textLabel"]){
        UILabel *textLabel = (UILabel *)([self valueForKey:@"_textLabel"]);
        textLabel.textColor = [UIColor whiteColor];
    }
}
%end
%hook PackageCollectionViewCell
-(void)layoutSubviews {
    %orig;
    if ([self valueForKey:@"authorLabel"]){
        UILabel *authorLabel = (UILabel *)([self valueForKey:@"authorLabel"]);
        authorLabel.textColor = kLightGrayColor;
    }
    if ([self valueForKey:@"descriptionLabel"]){
        UILabel *descriptionLabel = (UILabel *)([self valueForKey:@"descriptionLabel"]);
        descriptionLabel.textColor = kLightGrayColor;
    }
    if ([self valueForKey:@"titleLabel"]){
        UILabel *titleLabel = (UILabel *)([self valueForKey:@"titleLabel"]);
        titleLabel.textColor = [UIColor whiteColor];
    }
    if ([self valueForKey:@"_separatorView"]) {
        UIView *separatorView = (UIView *)([self valueForKey:@"_separatorView"]);
        separatorView.backgroundColor = kGrayColor;
    }
}
%end
%hook PackageListHeader
-(void)layoutSubviews {
    %orig;
    if ([self valueForKey:@"label"]){
        UILabel *label = (UILabel *)([self valueForKey:@"label"]);
        label.textColor = [UIColor whiteColor];
    }
}
%end
%hook FeaturedPackageView
-(void)layoutSubviews{
    %orig;
    if ([self valueForKey:@"_titleLabel"]) {
        UILabel *titleLabel = (UILabel *)([self valueForKey:@"_titleLabel"]);
        titleLabel.textColor = [UIColor whiteColor];
    }
    if ([self valueForKey:@"_separatorView"]) {
        UIView *separatorView = (UIView *)([self valueForKey:@"_separatorView"]);
        separatorView.backgroundColor = kGrayColor;
    }
}
-(void)touchesBegan:(id)arg1 withEvent:(id)arg2{
    self.backgroundColor = kGrayColor;
}
%end
%hook FeaturedButton
-(void)setBackgroundColor:(UIColor *)arg1{
    arg1 = kLighterDarkColor;
    %orig(arg1);
}
%end
%hook FeaturedBannersView
-(void)layoutSubviews {
    %orig;
    self.backgroundColor = kDarkColor;
}
%end
%hook FeaturedHeaderView
-(void)layoutSubviews {
    %orig;
    self.backgroundColor = kDarkColor;
    if ([self valueForKey:@"_headerLabel"]) {
        UILabel *headerLabel = (UILabel *)([self valueForKey:@"_headerLabel"]);
        headerLabel.textColor = [UIColor whiteColor];
    }
}
%end
%hook FeaturedViewController
-(void)viewDidLoad{
    %orig;
    self.view.backgroundColor = kDarkColor;
    //DRM
    
}
%end
%hook PackageViewController
-(void)viewDidLoad{
    %orig;
    self.view.backgroundColor = kDarkColor;
}
%end
%hook FeaturedAutoStackView
-(void)layoutSubviews {
    %orig;
    self.backgroundColor = kDarkColor;
}
%end

%hook CSTextRenderView
-(void)layoutSubviews{
    %orig;
    self.tintColor = [UIColor whiteColor];
    // NSAttributedString *attributedText = MSHookIvar<NSAttributedString *>(self, "_attributedText");
    // NSMutableAttributedString *mutableAttributedText= attributedText.mutableCopy;
    // [mutableAttributedText.mutableString setString:[attributedText.string stringByReplacingOccurrencesOfString:@"kCGColorSpaceModelRGB 0 0 0 1" withString:@"kCGColorSpaceModelRGB 1 1 1 1"]];
    // MSHookIvar<NSAttributedString *>(self, "_attributedText") = mutableAttributedText;

    NSAttributedString *attributedText = MSHookIvar<NSAttributedString *>(self, "_attributedText");
    NSMutableAttributedString *mutableAttributedText = [attributedText mutableCopy];
    [mutableAttributedText addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, [mutableAttributedText length])];
    MSHookIvar<NSAttributedString *>(self, "_attributedText") = mutableAttributedText;
}
%end
%hook UIViewController
-(void)viewDidLoad{
    %orig;
    //if (@available(iOS 11.0, *)){
        self.navigationController.navigationBar.largeTitleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    //}
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.translucent = YES;
    #pragma GCC diagnostic push 
    #pragma GCC diagnostic ignored "-Wdeprecated-declarations"
    //Screw off deprecation
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    #pragma GCC diagnostic pop

    // UILabel* demoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
    // demoLabel.backgroundColor = kDarkColor;
    // demoLabel.textAlignment = NSTextAlignmentCenter;
    // demoLabel.textColor = [UIColor redColor];
    // demoLabel.text = @"Ocean (Beta)";
    // demoLabel.center = CGPointMake(self.navigationController.navigationBar.frame.size.width / 2, self.navigationController.navigationBar.frame.size.height / 2);
    // [demoLabel sizeToFit];
    // [self.navigationController.navigationBar addSubview:demoLabel];

}
- (long long)preferredStatusBarStyle {
	return 1;
}
%end
%hook UITableViewCell
-(void)layoutSubviews {
    %orig;
    self.backgroundColor = kDarkColor;
    if ([self valueForKey:@"textLabel"]){
        UILabel *detailTextLabel = (UILabel *)([self valueForKey:@"textLabel"]);
        detailTextLabel.textColor = [UIColor whiteColor];
    }
    if ([self valueForKey:@"detailTextLabel"]){
        UILabel *detailTextLabel = (UILabel *)([self valueForKey:@"detailTextLabel"]);
        detailTextLabel.textColor = [UIColor whiteColor];
    }
}
%end
%hook UITableView
-(void)layoutSubviews {
    %orig;
    self.backgroundColor = kDarkColor;
    self.tintColor = [UIColor whiteColor];
}
%end
%hook UILabel
-(void)layoutSubviews {
    %orig;
    if ([self.superview isMemberOfClass:@("UITableView")]){
        self.textColor = [UIColor whiteColor];
    }
}
%end
%hook _UIButtonBarStackView
-(void)layoutSubviews{
    %orig;
    self.backgroundColor = kDarkTranslucentColor;
}
%end
%hook _UIVisualEffectSubview
-(void)setBackgroundColor:(id)arg1 {
  arg1 = kDarkTranslucentColor;
  %orig(arg1);
}
%end
%hook NewsViewController
-(void)viewDidLoad{
    %orig;
    self.view.backgroundColor = kDarkColor;
    for(UILabel *subview in self.view.subviews){
        subview.textColor = [UIColor whiteColor];
    }
}
%end 
@interface _UIBarBackground : UIView
@end
%hook _UIBarBackground
-(void)layoutSubviews{
    %orig;
    if([self.superview isKindOfClass:NSClassFromString(@"TabBar")]){
        for(UIImageView *imageView in self.subviews){
            imageView.backgroundColor = kDarkishGrayColor;
        }
    }
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
%end