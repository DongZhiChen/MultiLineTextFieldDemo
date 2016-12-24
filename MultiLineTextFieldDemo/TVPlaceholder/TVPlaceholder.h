//
//  TVPlaceholder.h
//  YaoWeiNong
//
//  Created by ceing on 16/6/21.
//  Copyright © 2016年 tcm. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface TVPlaceholder : UITextView

@property(nonatomic, strong) IBInspectable NSString *placeholder;

@property (nonatomic, assign) IBInspectable float borderCornerRadius;

@property(nonatomic, strong) IBInspectable UIColor  *placeholderColor;


@end
