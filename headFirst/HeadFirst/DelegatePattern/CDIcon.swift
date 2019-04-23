//
//  CDIcon.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/22.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation
import UIKit

protocol Icon {
    func getIconWidth() -> CGFloat
    func getIconHeight() -> CGFloat
    func paintIcon()
}

class ImageIcon: Icon {
    var imageURL: URL
    var image: UIImage?
    init(withURL url:  URL) {
        self.imageURL = url
    }
    
    func getIconWidth() -> CGFloat {
        return image?.size.width ?? 0
    }
    
    func getIconHeight() -> CGFloat {
        return image?.size.height ?? 0
    }
    
    func paintIcon() {
        
    }
}

class ImageProxy: Icon {
    var imageIcon: ImageIcon?
    var imageURL: URL
    
    init(withURL url: URL) {
        self.imageURL = url
    }
    
    func getIconWidth() -> CGFloat {
        if imageIcon != nil {
            return imageIcon?.getIconWidth() ?? 0
        }
        return 800
    }
    
    func getIconHeight() -> CGFloat {
        if imageIcon != nil {
            return imageIcon?.getIconWidth() ?? 0
        }
        return 600
    }
    
    func paintIcon() {
        if imageIcon != nil {
            imageIcon?.paintIcon()
        } else {
            DispatchQueue.global().async {
                self.imageIcon = ImageIcon(withURL: self.imageURL)
            }
        }
    }
    
    
}
