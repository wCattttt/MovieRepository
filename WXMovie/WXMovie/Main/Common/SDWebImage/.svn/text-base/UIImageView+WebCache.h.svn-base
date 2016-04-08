/*
 * This file is part of the SDWebImage package.
 * (c) Olivier Poitrey <rs@dailymotion.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "SDWebImageCompat.h"
#import "SDWebImageManagerDelegate.h"

@interface UIImageView (WebCache) <SDWebImageManagerDelegate>

- (void)setImageWithURL:(NSURL *)url;  //   根据URL设置图片
- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;
//网络返回图片数据时默认显示的图片
- (void)cancelCurrentImageLoad;

@end
