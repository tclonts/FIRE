//
//  InformationViewController.swift
//  FIRE
//
//  Created by Tyler Clonts on 6/11/18.
//  Copyright © 2018 Tyler Clonts. All rights reserved.
//

import UIKit

class PowerViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var backArrowButton: UIButton!
    @IBOutlet weak var nextArrowButton: UIButton!
    
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.alpha = 0

        
        view.backgroundColor = UIColor.mmDarkGreen
        textView.backgroundColor = UIColor.mmDarkGreen
        titleLabel.textColor = UIColor.mmWhiteIce
        textView.textColor = UIColor.mmWhiteIce
        pageControl.currentPageIndicatorTintColor = UIColor.mmTealBlue
        pageControl.pageIndicatorTintColor = UIColor.mmWhiteIce
        backArrowButton.tintColor = UIColor.mmTealBlue
        nextArrowButton.tintColor = UIColor.mmTealBlue
        
        imageView.loadGif(name: "HourGlass")
        
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        textView.setContentOffset(CGPoint.zero, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        showImageView()
    }

    func showImageView() {
        UIView.animate(withDuration: 1, animations: {
            self.imageView.alpha = 1

        }) { (true) in
            
        }
    }


}
