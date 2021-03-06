//
//  LDZhihuRefreshFooterView.m
//  LDRefresh
//
//  Created by lidi on 10/11/15.
//  Copyright © 2015 lidi. All rights reserved.
//

#import "LDZhihuRefreshFooterView.h"
#import "LDZhihuArrow.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define TextColor   [UIColor colorWithRed:120/255.0 green:120/255.0 blue:120/255.0 alpha:1.0]
#define TextFont    [UIFont systemFontOfSize:12.0f]

@interface LDZhihuRefreshFooterView ()
@property (nonatomic, strong) UILabel      *statusLab;
@property (nonatomic, strong) LDZhihuArrow *zhihuArrow;
@end

@implementation LDZhihuRefreshFooterView

- (NSDictionary *)stateTextDic{
    return @{@"normalText" : @"载入下一篇",
             @"pullingText" : @"载入下一篇",
             @"loadingText" : @"载入下一篇"
             };
}

- (CGFloat)dragHeightThreshold {
    return LDRefreshFooterHeight;
}

- (void)drawRefreshView {
    self.frame = CGRectMake(0, 0, ScreenWidth, LDRefreshFooterHeight);
    
    CGFloat TopMargin    = 15.0f;
    CGFloat bottomMargin = 15.0f;
    
    self.statusLab = ({
        UILabel *lab      = [[UILabel alloc] init];
        lab.frame         = CGRectMake(0, TopMargin, ScreenWidth, 12.0f);
        lab.font          = TextFont;
        lab.textColor     = TextColor;
        lab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:lab];
        
        lab;
    });
    
    self.zhihuArrow = ({
        LDZhihuArrow *zhihuArrow = [[LDZhihuArrow alloc] initWithFrame:CGRectMake(ScreenWidth/2.0 - kArrowWidth/2.0, LDRefreshFooterHeight - bottomMargin, kArrowWidth, kArrowUpDownHeight)];
        [self addSubview:zhihuArrow];
        
        zhihuArrow;
    });
}

- (void)normalAnimation{
    _statusLab.text = self.stateTextDic[@"normalText"];
    
    [_zhihuArrow showDownArrow];
}

- (void)pullingAnimation{
    _statusLab.text = self.stateTextDic[@"pullingText"];
    
    [_zhihuArrow showLine];
}

- (void)loadingAnimation {
    _statusLab.text = self.stateTextDic[@"loadingText"];
    
    [_zhihuArrow showLine];
}
@end
