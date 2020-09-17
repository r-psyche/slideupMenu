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
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var firstView: UIView!
    @IBOutlet var secondView: UIView!
    @IBOutlet var thirdView: UIView!
    
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
        slideupView.heightAnchor.constraint(equalToConstant: self.slideUpViewHeight).isActive = true
        slideupView.centerYAnchor.constraint(equalTo: parentView.layoutMarginsGuide.bottomAnchor).isActive = true
        
        setupHideMenu()
    }
    
    func setupHideMenu() {
        self.firstView.isHidden = true
        self.secondView.isHidden = false
        self.thirdView.isHidden = true
    }
    
    func setupShowMenu() {
        self.firstView?.isHidden = false
        self.secondView?.isHidden = true
        self.thirdView?.isHidden = false
    }
    
    func touchSlideUpMenu() {
        if isShow == false {
            UIView.animate(withDuration: 0, animations: {
                self.setupShowMenu()
            }) { (success) in
                UIView.animate(withDuration: 0.1, delay: 0, options: [.curveEaseInOut], animations: {
                    self.slideupView.frame = CGRect(x: 0, y: self.screenSize.height - self.slideUpViewHeight - 100, width: self.screenSize.width, height: self.slideUpViewHeight)
                }, completion: { success in
                    self.isShow = true
                })
            }
        } else {
            UIView.animate(withDuration: 0.1, delay: 0, options: [.curveEaseInOut, .beginFromCurrentState], animations: {
                self.slideupView.frame = CGRect(x: 0, y: self.screenSize.height - self.slideUpViewHeight + 10, width: self.screenSize.width, height: self.slideUpViewHeight)
            }, completion: { success in
                self.setupHideMenu()
                self.isShow = false
            })
        }
        
    }
}
