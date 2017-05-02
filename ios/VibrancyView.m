#if __has_include(<React/RCTComponent.h>)
  #import <React/RCTComponent.h>
#elif __has_include("RCTComponent.h")
  #import "RCTComponent.h"
#else
  #import "React/RCTComponent.h"
#endif

#import "BlurView.h"
#import "VibrancyView.h"

@interface VibrancyView ()

@property (nonatomic, strong) UIVibrancyEffect *vibrancyEffect;
@property (nonatomic, strong) UIVisualEffectView *vibrancyEffectView;

@end

@implementation VibrancyView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.vibrancyEffectView = [[UIVisualEffectView alloc] init];
        self.vibrancyEffectView.frame = frame;
        [self updateVibrancyEffect];

        [self.blurEffectView.contentView addSubview:self.vibrancyEffectView];
    }

    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.vibrancyEffectView.frame = self.bounds;
}

- (void)insertReactSubview:(id<RCTComponent>)subview atIndex:(NSInteger)atIndex {
    [self.vibrancyEffectView.contentView addSubview:(UIView*)subview];
}

- (void)updateBlurEffect
{
  [super updateBlurEffect];
  [self updateVibrancyEffect];
}

- (void)updateVibrancyEffect
{
  self.vibrancyEffect = [UIVibrancyEffect effectForBlurEffect:self.blurEffect];
  self.vibrancyEffectView.effect = self.vibrancyEffect;
}

@end
