//
//  ViewController.swift
//  slideupMenu
//
//  Created by rose on 2020/09/11.
//  Copyright © 2020 rose. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!

    var slideUpView:SlideUpMenu!
    
    override func viewDidLoad() {
        slideUpView = SlideUpMenu(frame: CGRect.zero)
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let screenSize = UIScreen.main.bounds.size
        
        contentView.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height * 2)
        self.scrollView.contentSize = contentView.frame.size
        contentView.bottomAnchor.constraint(equalTo: self.scrollView.layoutMarginsGuide.bottomAnchor).isActive = true
        
        slideUpView?.setupView(parentView: view)
    }
    
    @IBAction func touchOpenButton(_ sender: Any) {
        
        slideUpView?.touchSlideUpMenu()
    }


}

