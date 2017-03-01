//
//  UIButton+IPaUITool.swift
//  IPaUITool
//
//  Created by IPa Chen on 2015/10/5.
//  Copyright © 2015年 A Magic Studio. All rights reserved.
//

import UIKit

extension UIButton
{
    open func centerImageUpTitleDown(_ space:CGFloat) {
        guard let imageView = imageView,let image = imageView.image,let titleLabel = titleLabel,let titleText = titleLabel.text else {
            return
        }
        let imageSize = image.size
        var x = -imageSize.width * 0.5
        var y = (imageSize.height + space) * 0.5
        titleEdgeInsets = UIEdgeInsetsMake(
            y, x, -y, -x)
        
        // raise the image and push it right so it appears centered
        //  above the text
        let titleSize = titleText.size(attributes: [NSFontAttributeName: titleLabel.font])
        x = titleSize.width * 0.5
        y = -(titleSize.height + space) * 0.5
        imageEdgeInsets = UIEdgeInsetsMake(
            y, x, -y, -x)
        let width = max(imageSize.width,titleSize.width)
        let height = imageSize.height + titleSize.height + space
        x = (width - bounds.width) * 0.5
        y = (height - bounds.height) * 0.5
        contentEdgeInsets = UIEdgeInsetsMake(y, x, y, x)
    }
    open func imageAlignRight(_ space:CGFloat) {
        guard let imageView = imageView,let titleLabel = titleLabel else {
            return
        }
        titleEdgeInsets = UIEdgeInsetsMake(0, -imageView.frame.size.width - space, 0, imageView.frame.size.width)
        imageEdgeInsets = UIEdgeInsetsMake(0, titleLabel.frame.size.width + space, 0, -titleLabel.frame.size.width)
        
        contentEdgeInsets = UIEdgeInsetsMake(0, space, 0, space)
    }
}

   
