//
//  purposeViewController.swift
//  FIRE
//
//  Created by Tyler Clonts on 8/4/18.
//  Copyright © 2018 Tyler Clonts. All rights reserved.
//

import UIKit

class PurposeViewController: UIViewController {
    
    
    @IBOutlet weak var learnMoreButton: UIButton!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func learnMoreButtonTapped(_ sender: UIButton) {
        

        
        UIApplication.shared.open(NSURL(string: "https://mrfiguy.com/2018/05/28/what-is-financial-independence/")! as URL, options: [:], completionHandler: { (success) in
            print("Open url : \(success)")
        })
    }
    
    
}
