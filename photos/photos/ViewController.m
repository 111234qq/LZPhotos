//
//  ViewController.m
//  photos
//
//  Created by apple on 17/5/9.
//  Copyright © 2017年 apple. All rights reserved.
//

#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]

#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#import "ViewController.h"
#import "ColorMatrix.h"
#import "ImageUtil.h"

@interface ViewController (){
    UIImage *image;
    UIImageView *imageview;
    NSArray *arr;
    NSArray *contentArr;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    arr = @[@"LOMO",@"黑白",@"复古",@"哥特",@"锐化",@"淡雅",@"酒红",@"浪漫",@"光晕",@"蓝调",@"梦幻",@"夜色"];
    
    
    image = [UIImage imageNamed:@"gaoyuanyuan"];
    imageview = [[UIImageView alloc]initWithImage:image];
    imageview.frame = CGRectMake(60, 20, self.view.frame.size.width, self.view.frame.size.height-100);
    [self.view addSubview:imageview];
    
    for (int i = 0; i < arr.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:arr[i] forState:0];
        btn.frame = CGRectMake(5, 20 + i * 44, 50, 40);
        [self.view addSubview:btn];
        btn.tag = 10 + i;
        btn.backgroundColor = randomColor;
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitleColor:[UIColor blackColor] forState:0];
    }
}

-(void)click:(UIButton *)btn{
    NSLog(@"%ld",btn.tag);
    
    NSInteger currentIndex = btn.tag - 9;
    UIImage *buttonImage;
    switch (currentIndex)
    {
        case 0:
        {
            buttonImage = image;
        }
            break;
        case 1:
        {
            buttonImage = [ImageUtil imageWithImage:image withColorMatrix:colormatrix_lomo];
        }
            break;
        case 2:
        {
            buttonImage = [ImageUtil imageWithImage:image withColorMatrix:colormatrix_heibai];
        }
            break;
        case 3:
        {
            buttonImage = [ImageUtil imageWithImage:image withColorMatrix:colormatrix_huajiu];
        }
            break;
        case 4:
        {
            buttonImage = [ImageUtil imageWithImage:image withColorMatrix:colormatrix_gete];
        }
            break;
        case 5:
        {
            buttonImage = [ImageUtil imageWithImage:image withColorMatrix:colormatrix_ruise];
        }
            break;
        case 6:
        {
            buttonImage = [ImageUtil imageWithImage:image withColorMatrix:colormatrix_danya];
        }
            break;
        case 7:
        {
            buttonImage = [ImageUtil imageWithImage:image withColorMatrix:colormatrix_jiuhong];
        }
            break;
        case 8:
        {
            buttonImage = [ImageUtil imageWithImage:image withColorMatrix:colormatrix_qingning];
        }
            break;
        case 9:
        {
            buttonImage = [ImageUtil imageWithImage:image withColorMatrix:colormatrix_langman];
        }
            break;
        case 10:
        {
            buttonImage = [ImageUtil imageWithImage:image withColorMatrix:colormatrix_guangyun];
        }
            break;
        case 11:
        {
            buttonImage = [ImageUtil imageWithImage:image withColorMatrix:colormatrix_landiao];
        }
            break;
        case 12:
        {
            buttonImage = [ImageUtil imageWithImage:image withColorMatrix:colormatrix_menghuan];
        }
            break;
        case 13:
        {
            buttonImage = [ImageUtil imageWithImage:image withColorMatrix:colormatrix_yese];
        }
            break;
            
        default:
            break;
    }
    
    imageview.image = buttonImage;
}

@end
