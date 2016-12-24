//
//  TVPlaceholder.m
//  YaoWeiNong
//
//  Created by ceing on 16/6/21.
//  Copyright © 2016年 tcm. All rights reserved.
//

#import "TVPlaceholder.h"

@interface TVPlaceholder ()

@property(nonatomic, strong)UILabel *placeLable;

@end

@implementation TVPlaceholder{

    
}


- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.placeLable];
        self.placeholder = @"placeholder";
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = [UIColor colorWithRed:43.0/255 green:43.0/255 blue:43.0/255 alpha:0.6].CGColor;
        self.borderCornerRadius = 8;
        
    }
    
    return self;
    
}


-(void)setBorderCornerRadius:(float)borderCornerRadius{

    _borderCornerRadius = borderCornerRadius;
    
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = borderCornerRadius;
    
}


#pragma mark - NSNotification -


-(void)textChanged{
    
    if (self.text.length == 0) {
        
        self.placeLable.hidden = NO;
        
    }else{
        
        self.placeLable.hidden = YES;
        
    }
    
}


#pragma mark -

-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGRect temp = _placeLable.frame;
    temp.origin.y = 8.0f;
    temp.origin.x = 5.0f;
    temp.size.width = self.frame.size.width - temp.origin.x;
    CGSize size = [self.placeLable sizeThatFits:CGSizeMake(temp.size.width, MAXFLOAT)];
    self.placeLable.frame = CGRectMake(5, 8, temp.size.width,size.height);
}



#pragma mark - Setter,Getter -

-(void)setFont:(UIFont *)font{
    
    [super setFont:font];
    
    self.placeLable.font = font;
    [self setNeedsLayout];
    
}


-(void)setText:(NSString *)text{
    
    [super setText:text];
    [self textChanged];
    
}

-(void)setPlaceholder:(NSString *)placeholder{
    
    self.placeLable.text = placeholder;
    _placeholder = placeholder;
    
}

-(void)setPlaceholderColor:(UIColor *)placeholderColor{

    _placeholderColor = placeholderColor;
    
    self.placeLable.textColor = placeholderColor;
    
}



-(UILabel *)placeLable{
    
    if(_placeLable == nil){
        
        _placeLable = [[UILabel alloc] initWithFrame:CGRectMake(5, 0,200, 30)];
        _placeLable.numberOfLines = 0;
        _placeLable.backgroundColor = [UIColor clearColor];
        _placeLable.font = self.font;
        _placeLable.textColor = [UIColor grayColor];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged) name:UITextViewTextDidChangeNotification object:self];
        
    }
    
    return _placeLable;
    
}


#pragma mark - 

-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

@end
