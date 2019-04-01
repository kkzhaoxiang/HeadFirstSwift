//
//  CALayer+ks.swift
//  KSCache
//
//  Created by 疯狂的石头 on 2018/11/12.
//  Copyright © 2018 疯狂的石头. All rights reserved.
//

import Foundation
import UIKit

extension KSImageManager where Base: CALayer {
    
    func setImage(withURL url: URL?,
                  placeHolder: UIImage? = nil,
                  imageTransition transition: UIView.AnimationOptions = .transitionCrossDissolve) {
        
        guard let url = url else {
            return
        }
        
        if self.cache.contain(cacheKey: url.absoluteString) {
            let image = self.cache.object(for: url.absoluteString) as! UIImage
            self.base.contents = image.cgImage
        } else {
//            base.ks.activityStartAnimtationing()
            
            DispatchQueue.main.async {
                self.base.contents = nil
            }
            
            KSDownloadManager.manager.downloadImage(withUrl: url) { (data, error) in
//                self.base.ks.activityStopAnimtationing()
                
                guard let data = data else {
                    return
                }
            
                let image = UIImage(data: data)
                self.cache.setObject(image, for: url.absoluteString)
                
                DispatchQueue.main.async {                    
                    self.base.display()
                }
            }
        }
    }
}

extension CALayer: KSCompatible {}

class KSLayer: CALayer {

    func asyncDisplay() {
        DispatchQueue.global().async {
            


            
        }
    }
    
}
