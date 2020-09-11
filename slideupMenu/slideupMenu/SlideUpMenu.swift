//
//  SlideUpMenu.swift
//  slideUpMenu
//
//  Created by rose on 2020/09/11.
//  Copyright © 2020 rose. All rights reserved.
//

import Foundation
import UIKit

class SlideUpMenu: UIView {
    
    @IBOutlet var slideupView: UIView!
    
    private var isShow:Bool = false
    private let slideUpViewHeight: CGFloat = 250
    private let screenSize = UIScreen.main.bounds.size
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupView(parentView: UIView) {
        Bundle.main.loadNibNamed("SlideUpMenu", owner: self, options: nil)
        slideupView.frame = CGRect(x: 0, y: 0, width: parentView.frame.size.width, height: slideUpViewHeight)
        slideupView.translatesAutoresizingMaskIntoConstraints = false
        parentView.addSubview(slideupView)
        
        slideupView.widthAnchor.constraint(equalToConstant: screenSize.width).isActive = true
        slideupView.heightAnchor.constraint(equalToConstant: self.slideUpViewHeight - 70).isActive = true
        slideupView.centerYAnchor.constraint(equalTo: parentView.layoutMarginsGuide.bottomAnchor).isActive = true
    }
    
    func touchSlideUpMenu() {
        if isShow == false {
            UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseInOut], animations: {
                self.slideupView.frame = CGRect(x: 0, y: self.screenSize.height - self.slideUpViewHeight - 100, width: self.screenSize.width, height: self.slideUpViewHeight)
            }, completion: nil)
            self.isShow = true
        } else {
            UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseInOut], animations: {
                self.slideupView.frame = CGRect(x: 0, y: self.screenSize.height - self.slideUpViewHeight + 30, width: self.screenSize.width, height: self.slideUpViewHeight)
            }, completion: nil)
            self.isShow = false
        }
        
    }
}
