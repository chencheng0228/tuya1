//
//  TuYaimaView.m
//  TestQuartz_涂鸦
//
//  Created by admin on 15-1-15.
//  Copyright (c) 2015年 ___CC___. All rights reserved.
//

#import "TuYaimaView.h"
@interface TuYaimaView ()
@property (nonatomic,strong) NSMutableArray *paths;
@end
@implementation TuYaimaView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSbuView:frame];
    }
    return self;
}

-(void)initSbuView:(CGRect)frame
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(backView) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
}

-(NSMutableArray *)paths
{
    if (_paths==nil) {
        _paths = [NSMutableArray array];
    }
    return _paths;
}

//开始手指触摸事件
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //获取对应的uitouch对象
    UITouch *touch = [touches anyObject];
    //通过touch对象获取手指触摸的位置
    CGPoint starPoint = [touch locationInView:touch.view];
    //3.当用户手指按下的时候创建一条路径
    UIBezierPath * path = [UIBezierPath bezierPath];
    //设置路径的相关属性
    [path setLineWidth:5];
    [path setLineJoinStyle:kCGLineJoinRound];
    [path setLineCapStyle:kCGLineCapRound];
    //4.设置当前路径的起点
    [path moveToPoint:starPoint];
    //5.将路径添加到数组中去
    [self.paths addObject:path];
    
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //1.获取手指对应的UIToch对象
    UITouch *touch=[touches anyObject];
    //2.通过UIToch对象获取手指触摸的位置
    CGPoint movePoint=[touch locationInView:touch.view];
    //3.取出当前的path
    UIBezierPath *currentPath=[self.paths lastObject];
    //4.设置当前路径的终点
    [currentPath addLineToPoint:movePoint];
    
    //5.调用drawRect方法重绘视图
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    //根据路径绘制所有的线段
    for (UIBezierPath *path in self.paths) {
        [path stroke];
    }
}

-(void)clearView
{
    //清空所有的路径
    [self.paths removeAllObjects];
    //调用方法重新绘图
    [self setNeedsDisplay];
}


//回退操作
-(void)backView
{
    //移除路径数组中的最后一个元素（最后一条路径）
    [self.paths removeLastObject];
    //重新绘图
    [self setNeedsDisplay];
}

-(void)viewAddIma:(NSString *)imaName
{
    //    if (self.imaView==nil) {
    //        self.imaView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, 200,200)];
    //        [self addSubview:self.imaView];
    //    }
    //    self.imaView.image = [UIImage imageNamed:imaName];
    self.image = [UIImage imageNamed:imaName];
    
}

@end
