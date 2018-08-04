//
//  InformationViewController.swift
//  FIRE
//
//  Created by Tyler Clonts on 6/11/18.
//  Copyright © 2018 Tyler Clonts. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var viewTwo: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var backArrowButton: UIButton!
    @IBOutlet weak var nextArrowButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewTwo.alpha = 0
        imageView.alpha = 0
        
        view.backgroundColor = UIColor.mmDarkGreen
        viewTwo.backgroundColor = UIColor.mmWhiteIce
        textView.backgroundColor = UIColor.mmDarkGreen
        titleLabel.textColor = UIColor.mmWhiteIce
        textView.textColor = UIColor.mmWhiteIce
        pageControl.currentPageIndicatorTintColor = UIColor.mmTealBlue
        pageControl.pageIndicatorTintColor = UIColor.mmWhiteIce
        backArrowButton.tintColor = UIColor.mmTealBlue
        nextArrowButton.tintColor = UIColor.mmTealBlue
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showViewTwo()
    }
    
    func showViewTwo() {
        UIView.animate(withDuration: 1, animations: {
            self.viewTwo.alpha = 1
            
        }) { (true) in
            self.showImageView()
        }
    }
    
    func showImageView() {
        UIView.animate(withDuration: 1, animations: {
            self.imageView.alpha = 1
        }) { (true) in
            
        }
    }
    
}
