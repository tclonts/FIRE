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
    @IBOutlet weak var greenFireImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.alpha = 0
        informationLabel.alpha = 0
        getStartedButton.alpha = 0
        greenFireImageView.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
       showGreenFireImageView()
        
    }
    
    func showGreenFireImageView() {
        UIView.animate(withDuration: 1, animations: {
            self.greenFireImageView.alpha = 0.6
        }) { (true) in
            self.showWelcomeLabel()
            
        }
    }
    
    func showWelcomeLabel() {
        UIView.animate(withDuration: 1, animations: {
            self.welcomeLabel.alpha = 1
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
