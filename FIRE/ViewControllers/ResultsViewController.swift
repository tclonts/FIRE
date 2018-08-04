//
//  ResultsViewController.swift
//  FIRE
//
//  Created by Tyler Clonts on 6/11/18.
//  Copyright © 2018 Tyler Clonts. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var resultsTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsTextView.text = "Based on these inputs, you are \(year?.description ?? "?") years away from financial Independence! You could reach finacial independence when you are \(age?.description ?? "?") years old."
        view.setGradientBackground(colorTop: UIColor.mmDarkGreen, colorBottom: UIColor.mmWhiteIce)
        resultsTextView.backgroundColor = UIColor.clear
        resultsTextView.textColor = UIColor.mmWhiteIce
    }

    var age: Int?
    var year: Int?
 
    

  

}
