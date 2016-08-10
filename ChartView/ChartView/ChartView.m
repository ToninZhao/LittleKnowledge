//
//  ChartView.m
//  ChartView
//
//  Created by ZhaoNing on 16/8/10.
//  Copyright © 2016年 Tonin. All rights reserved.
//

#import "ChartView.h"
@interface ChartView()

@property (nonatomic, weak) NSTimer *timer;

@end
@implementation ChartView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(setNeedsDisplay) userInfo:nil repeats:YES];
        
        self.timer = timer;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];

    CGContextRef context = UIGraphicsGetCurrentContext();
    for (int i = 0; i < 4; i++) {
        UIColor *fillColor;
        switch (i) {
            case 0:
                fillColor = [UIColor redColor];
                break;
            case 1:
                fillColor = [UIColor blackColor];
                break;
            case 2:
                fillColor = [UIColor yellowColor];
                break;
            case 3:
                fillColor = [UIColor lightGrayColor];
                break;
            default:
                break;
        }
        CGContextSetFillColorWithColor(context, fillColor.CGColor);
        CGContextMoveToPoint(context, rect.size.width / 2, rect.size.height / 2);
        CGContextAddArc(context, rect.size.width / 2, rect.size.height / 2, rect.size.width / 2, M_PI / 2 * i,  M_PI / 2 * (i + 1), 0);
        CGContextClosePath(context);
        CGContextDrawPath(context, kCGPathFill);
    }
    [self drawText:[NSString stringWithFormat:@"测试"] Context:context Rect:rect];
    UIColor *centerColor = self.backgroundColor;
    CGContextSetFillColorWithColor(context, centerColor.CGColor);
    CGContextMoveToPoint(context, rect.size.width / 2, rect.size.height / 2);

    CGContextAddArc(context, rect.size.width / 2, rect.size.height / 2, rect.size.width / 4, 0, M_PI * 2, 0);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFill);
    //[self.timer invalidate];
}
- (void)drawText:(NSString *)text Context:(CGContextRef)context Rect:(CGRect)rect {
    
    UIFont  *font = [UIFont boldSystemFontOfSize:18.0];
    UIColor *color = [UIColor greenColor];
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    paragraphStyle.alignment =  NSTextAlignmentCenter;
    CGFloat radius = rect.size.width / 8 * 3;
    
    for (int index = 0; index < 4; index++) {
        CGRect textRect = CGRectMake(rect.size.width / 2 + radius * cos(M_PI / 4 + M_PI / 2 * (index - 1)) - 30, rect.size.height / 2 + radius * sin(M_PI / 4 + M_PI / 2 * (index - 1)) - 10, 60, 20);
        [[NSString stringWithFormat:@"%@%d", text, index] drawInRect:textRect withAttributes: @{ NSFontAttributeName : font,NSForegroundColorAttributeName : color, NSParagraphStyleAttributeName : paragraphStyle}];
    }
   

}
@end
