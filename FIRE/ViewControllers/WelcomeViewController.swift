//
//  WelcomeViewController.swift
//  FIRE
//
//  Created by Tyler Clonts on 5/25/18.
//  Copyright © 2018 Tyler Clonts. All rights reserved.
//

import UIKit
import QuartzCore

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var fireWhiteImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.alpha = 0
        informationLabel.alpha = 0
        getStartedButton.alpha = 0
        fireWhiteImageView.alpha = 0
        
        
        getStartedButton.layer.borderColor = UIColor.mmTealBlue.cgColor
        getStartedButton.layer.borderWidth = 1
        getStartedButton.layer.cornerRadius = 5
        getStartedButton.backgroundColor = UIColor.mmTealBlue
       
//        getStartedButton.layer.cornerRadius = getStartedButton.frame.size.height/2
        getStartedButton.layer.masksToBounds = true
        getStartedButton.tintColor = UIColor.mmWhiteIce
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
       setView()
        
    }
    
    func setView() {
        UIView.animate(withDuration: 1, animations: {
            self.view.backgroundColor = UIColor.mmDarkGreen
            self.view.alpha = 1
        }) { (true) in
            self.showWelcomeLabel()
            
        }
    }
    
    func showWelcomeLabel() {
        UIView.animate(withDuration: 1, animations: {
            self.welcomeLabel.alpha = 1
            self.fireWhiteImageView.alpha = 1
        }) { (true) in
             self.showInformationLabel()
        }
    }
    
    func showInformationLabel() {
        UIView.animate(withDuration: 1, animations: {
            self.informationLabel.alpha = 1
        }) { (true) in
             self.showGetStartedButton()
        }
    }
    
    func showGetStartedButton() {
        UIView.animate(withDuration: 1, animations: {
            self.getStartedButton.alpha = 1
        }) { (true) in
            
        }
    }

}
