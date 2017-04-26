//
//  WHMovieSubjectCell.m
//  MovieFan
//
//  Created by Faye on 2017/4/25.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import "WHMovieSubjectCell.h"
#import <YYKit/UIImageView+YYWebImage.h>
#import <YYKit/UIImage+YYAdd.h>

@interface WHMovieSubjectCell ()

@property (nonatomic, strong) IBOutlet UIImageView *posterImgView;
@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) IBOutlet UILabel *ratingLable;
@property (nonatomic, strong) IBOutlet UILabel *directorLabel;
@property (nonatomic, strong) IBOutlet UILabel *castLabel;

@end

@implementation WHMovieSubjectCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setMovie:(WHMovieSubject *)movie {
    [self.posterImgView setImageWithURL:[NSURL URLWithString:movie.images.small]
                            placeholder:[UIImage imageWithColor:[UIColor lightGrayColor] size:self.posterImgView.frame.size]
                                options:YYWebImageOptionProgressiveBlur
                             completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
        
    }];
    self.nameLabel.text = movie.title;
    self.ratingLable.text = [NSString stringWithFormat:@"评分: %@", movie.rating.average];
    __block NSString *directers = @"导演: ";
    [movie.directors enumerateObjectsUsingBlock:^(WHCelebrity * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        directers = [directers stringByAppendingFormat:@"%@ ", obj.name];
    }];
    self.directorLabel.text = directers;
    __block NSString *casts = @"主演: ";
    [movie.casts enumerateObjectsUsingBlock:^(WHCelebrity * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        casts = [casts stringByAppendingFormat:@"%@ ", obj.name];
    }];
    self.castLabel.text = casts;
}

@end
