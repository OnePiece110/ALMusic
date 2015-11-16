//
//  TopCell.m
//  BaseProject
//
//  Created by adam on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TopCell.h"

@implementation TopCell

-(TRImageView *)iconIV{
    if (!_iconIV) {
        _iconIV = [[TRImageView alloc]init];
        [self.contentView addSubview:_iconIV];
        [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(65,65));
            if ([self isHasLabel]) {
                make.centerY.mas_equalTo(-20);
            }else{
                make.centerY.mas_equalTo(0);
            }
            
        }];
    }
    return _iconIV;
}

-(UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.topMargin.mas_equalTo(self.iconIV.mas_topMargin).mas_equalTo(-3);
            make.right.mas_equalTo(-10);
        }];
    }
    return _titleLb;
}

-(UILabel *)longTitleLb{
    if (!_longTitleLb) {
        _longTitleLb = [[UILabel alloc]init];
        _longTitleLb.font = [UIFont systemFontOfSize:14];
        _longTitleLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_longTitleLb];
        [_longTitleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.titleLb.mas_leftMargin);
            make.rightMargin.mas_equalTo(self.titleLb.mas_rightMargin);
            make.centerY.mas_equalTo(0);
        }];
    }
    return _longTitleLb;
}

-(UILabel *)playCountsLb{
    if (!_playCountsLb) {
        _playCountsLb = [UILabel new];
        _playCountsLb.font = [UIFont systemFontOfSize:13];
        _playCountsLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_playCountsLb];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"find_albumcell_play"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.longTitleLb.mas_leftMargin);
            make.size.mas_equalTo(CGSizeMake(11, 11));
            make.centerY.mas_equalTo(self.playCountsLb);
        }];
        [self.playCountsLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(3);
            make.bottomMargin.mas_equalTo(self.iconIV.mas_bottomMargin).mas_equalTo(3);
        }];
    }
    return _playCountsLb;
}

-(UILabel *)tracksLb{
    if (!_tracksLb) {
        _tracksLb = [UILabel new];
        _tracksLb.font = [UIFont systemFontOfSize:13];
        _tracksLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_tracksLb];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"album_tracks"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.playCountsLb.mas_right).mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(12, 12));
            make.centerY.mas_equalTo(self.playCountsLb);
        }];
        [self.tracksLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(3);
            make.centerY.mas_equalTo(self.playCountsLb);
        }];
    }
    return _tracksLb;
}

-(BOOL)isHasLabel{
    return _row = 0;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.separatorInset = UIEdgeInsetsMake(0, kWindowW/4-10, 0, 0);
    }
    return self;
}

@end
