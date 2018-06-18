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

    override func viewDidLoad() {
        super.viewDidLoad()
        createFire()
    }

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var getStartedButton: UIButton!
    
    func createFire() {
        let fireEmitter = CAEmitterLayer()
        fireEmitter.emitterPosition = CGPoint(x: 200, y: 500)
        fireEmitter.emitterSize = CGSize(width: 150, height: 10);
        fireEmitter.renderMode = kCAEmitterLayerAdditive;
        fireEmitter.emitterShape = kCAEmitterLayerLine
        fireEmitter.emitterCells = [createFireCell()];
        
        self.view.layer.addSublayer(fireEmitter)
    }
    
    func createFireCell() -> CAEmitterCell {
        let fire = CAEmitterCell();
        fire.alphaSpeed = -0.3
        fire.birthRate = 200;
        fire.lifetime = 60.0;
        fire.lifetimeRange = 0.5
        fire.color = UIColor.init(red: 0.0, green: 0.4, blue: 0.0, alpha: 0.6).cgColor
        fire.contents = UIImage(named: "fire")?.cgImage
        fire.emissionLongitude = CGFloat(Double.pi);
        fire.velocity = 80;
        fire.velocityRange = 5;
        fire.emissionRange = 0.5;
        fire.yAcceleration = -200;
        fire.scaleSpeed = 0.3;
        
        return fire
    }

}
