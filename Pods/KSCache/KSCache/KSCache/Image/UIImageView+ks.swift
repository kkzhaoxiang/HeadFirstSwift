//
//  UIImage.swift
//  KSCache
//
//  Created by 疯狂的石头 on 2018/11/2.
//  Copyright © 2018 疯狂的石头. All rights reserved.
//

import UIKit

extension UIImageView: KSCompatible { }

private var cacheKey = "KSImageCache"

extension KSImageManager where Base: UIImageView {
    

    func setImage(withURL url: URL?,
                  placeHolder: UIImage? = nil,
                  imageTransition transition: UIView.AnimationOptions = .transitionCrossDissolve) {

        guard let url = url else {
            return
        }

        if self.cache.contain(cacheKey: url.absoluteString) {
            let image = self.cache.object(for: url.absoluteString) as! UIImage
            self.base.image = image
        } else {
            base.ks.activityStartAnimtationing()

            DispatchQueue.main.async {
                self.base.image = nil
            }

            KSDownloadManager.manager.downloadImage(withUrl: url) { (data, error) in
                self.base.ks.activityStopAnimtationing()

                guard let data = data else {
                    return
                }

                let image = UIImage(data: data)
                self.cache.setObject(image, for: url.absoluteString)

                DispatchQueue.main.async {
                    UIView.transition(with: self.base,
                                      duration: 0.5,
                                      options: transition,
                                      animations: {
                                        self.base.layer.contents = image?.cgImage
                    }, completion: nil)
                }
            }
        }
    }
}

extension KSImageManager where Base: CALayer {
    
    func asyncDisplay() {
        DispatchQueue.global().async {
            let render = UIGraphicsImageRenderer(size: self.base.bounds.size)
            let image = render.image(actions: { (_) in })
            self.base.contents = image.cgImage
            
        }
    }
}

struct WebCache {
    static let shared = WebCache()
    var webCache: NSCache<NSString, UIImage>
    init() {
        webCache = NSCache()
    }
}
