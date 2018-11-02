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
        


        view.backgroundColor = UIColor.mmDarkGreen
        
        resultsTextView.backgroundColor = UIColor.clear
        resultsTextView.textColor = UIColor.mmWhiteIce
        resultsTextView.text = "Based on these inputs, you are \(year?.description ?? "?") years away from financial Independence! You could reach finacial independence when you are \(age?.description ?? "?") years old. \n\nAre you sitting on cloud 9 or down in the dumps? Now you have a snapshot into your future if things remain the same. If you like how things are trending, good work! Keep it up! If you don't like what you see, the good news is, you are in full control of your financial future. \n\nThe goal is to grow the gap between your income and expenses. That means finding ways to earn more, spend less, or a combination of the two. Start today by taking the '1% Challenge' ask yourself, how can I improve my money situation by 1%? Then all you need to do is continue this simple process until you are happy with your timeline to financial independence.\n\nGood luck, and check out Mr. Fi Guy by clicking the icon in the top right corner. "
    }
  
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        resultsTextView.setContentOffset(CGPoint.zero, animated: false)
    }
    
    
    
    var age: Int?
    var year: Int?
 
    @IBAction func webLinkButtonTapped(_ sender: UIBarButtonItem) {
        let link = "https://mrfiguy.com/"
        UIApplication.shared.canOpenURL(NSURL(string: link )! as URL)
        UIApplication.shared.open(NSURL(string: link)! as URL, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: { (success) in
            print("Open url : \(success)")
        })
    }
    
  

}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value)})
}
