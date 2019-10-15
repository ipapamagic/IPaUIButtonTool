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
    @objc open func centerImageUpTitleDown(_ space:CGFloat) {
        guard let imageView = imageView,let image = imageView.image,let titleLabel = titleLabel,let titleText = titleLabel.text else {
            return
        }
        let imageSize = image.size
        var x = -imageSize.width * 0.5
        var y = (imageSize.height + space) * 0.5
        titleEdgeInsets = UIEdgeInsets(
            top: y, left: x, bottom: -y, right: -x)
        
        // raise the image and push it right so it appears centered
        //  above the text
        let titleSize = titleText.size(withAttributes: [NSAttributedString.Key.font: titleLabel.font])
        x = titleSize.width * 0.5
        y = -(titleSize.height + space) * 0.5
        imageEdgeInsets = UIEdgeInsets(
            top: y, left: x, bottom: -y, right: -x)
        let width = max(imageSize.width,titleSize.width)
        let height = imageSize.height + titleSize.height + space
        x = (width - bounds.width) * 0.5
        y = (height - bounds.height) * 0.5
        contentEdgeInsets = UIEdgeInsets(top: y, left: x, bottom: y, right: x)
    }
    @objc open func imageAlignRight(_ space:CGFloat) {
        guard let imageView = imageView,let titleLabel = titleLabel else {
            return
        }
        titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageView.frame.size.width - space, bottom: 0, right: imageView.frame.size.width)
        imageEdgeInsets = UIEdgeInsets(top: 0, left: titleLabel.frame.size.width + space, bottom: 0, right: -titleLabel.frame.size.width)
        
        contentEdgeInsets = UIEdgeInsets(top: 0, left: space, bottom: 0, right: space)
    }
}

   
