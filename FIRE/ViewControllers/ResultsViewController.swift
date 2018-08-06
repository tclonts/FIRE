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
    @IBOutlet weak var webLink: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationController?.navigationBar.barTintColor = UIColor.mmMiddleGreen
//        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationItem.largeTitleDisplayMode = .always
//        navigationItem.title = "Results"
//        navigationController?.navigationBar.tintColor = UIColor.mmWhiteIce
//        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.mmWhiteIce]
//        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.mmWhiteIce]

        view.backgroundColor = UIColor.mmDarkGreen
        
        resultsTextView.backgroundColor = UIColor.clear
        resultsTextView.textColor = UIColor.mmWhiteIce
        resultsTextView.text = "Based on these inputs, you are \(year?.description ?? "?") years away from financial Independence! You could reach finacial independence when you are \(age?.description ?? "?") years old. \n\nAre you sitting on cloud 9 or down in the dumps? Now you have a snapshot into your future if things remain the same. If you like how things are trending, good work! Keep it up! If you don't like what you see, the good news is, you are in full control of your financial future. \n\nThe goal is to grow the gap between your income and expenses. That means finding ways to earn more, spend less, or a combination of the two. Start today by taking the '1% Challenge,' ask yourself, how can I improve my money situation by 1%? Then all you need to do is continue this simple process until you are happy with your timeline to financial independence.\n\nGood luck, and check out Mr. Fi Guy "
    }
  

    var age: Int?
    var year: Int?
 
    @IBAction func webLinkButtonTapped(_ sender: UIBarButtonItem) {
        let link = "https://mrfiguy.com/"
        UIApplication.shared.canOpenURL(NSURL(string: link )! as URL)
        UIApplication.shared.open(NSURL(string: link)! as URL, options: [:], completionHandler: { (success) in
            print("Open url : \(success)")
        })
    }
    
  

}
