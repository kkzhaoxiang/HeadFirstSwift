//
//  UIView+ks.swift
//  KSCache
//
//  Created by 疯狂的石头 on 2018/11/12.
//  Copyright © 2018 疯狂的石头. All rights reserved.
//

import Foundation
import UIKit

private var KSActivityIndecatorViewKey = "KSActivityIndecatorViewKey"

extension KSImageManager where Base: UIView {
    
    func activityStartAnimtationing() {
        DispatchQueue.main.async {
            let activity = UIActivityIndicatorView(style: .gray)
            activity.frame = CGRect.zero
            activity.center = CGPoint(x: self.base.bounds.width / 2, y: self.base.bounds.height / 2)
            self.base.addSubview(activity)
            objc_setAssociatedObject(self.base,
                                     &KSActivityIndecatorViewKey,
                                     activity,
                                     objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            activity.startAnimating()
        }
    }
    
    func activityStopAnimtationing() {
        DispatchQueue.main.async {
            let activity: UIActivityIndicatorView? = objc_getAssociatedObject(self.base,
                                                                              &KSActivityIndecatorViewKey)
                as? UIActivityIndicatorView
            activity?.stopAnimating()
        }
    }
}
