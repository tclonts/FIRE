//
//  AboutYourFinancesViewController.swift
//  FIRE
//
//  Created by Tyler Clonts on 6/11/18.
//  Copyright © 2018 Tyler Clonts. All rights reserved.
//

import UIKit

class AboutYourFinancesViewController: UIViewController {


    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var annualIncomeTextField: UITextField!
    @IBOutlet weak var annualSavingsRateTextField: UITextField!
    @IBOutlet weak var yearlyExpensesTextField: UITextField!
    @IBOutlet weak var totalSavingsTextField: UITextField!
    @IBOutlet weak var withdrawalRateTextField: UITextField!
    @IBOutlet weak var inflationRateTextField: UITextField!
    @IBOutlet weak var investmentReturnTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ageTextField.delegate = self
        annualIncomeTextField.delegate = self
        annualSavingsRateTextField.delegate = self
        yearlyExpensesTextField.delegate = self
        totalSavingsTextField.delegate = self
        withdrawalRateTextField.delegate = self
        inflationRateTextField.delegate = self
        investmentReturnTextField.delegate = self
        
        ageTextField.backgroundColor = UIColor.mmDarkGreen
        ageTextField.textColor = UIColor.mmWhiteIce
        annualIncomeTextField.backgroundColor = UIColor.mmDarkGreen
        annualIncomeTextField.textColor = UIColor.mmWhiteIce
        annualSavingsRateTextField.backgroundColor = UIColor.mmDarkGreen
        annualSavingsRateTextField.textColor = UIColor.mmWhiteIce
        yearlyExpensesTextField.backgroundColor = UIColor.mmDarkGreen
        yearlyExpensesTextField.textColor = UIColor.mmWhiteIce
        totalSavingsTextField.backgroundColor = UIColor.mmDarkGreen
        totalSavingsTextField.textColor = UIColor.mmWhiteIce
        withdrawalRateTextField.backgroundColor = UIColor.mmDarkGreen
        withdrawalRateTextField.textColor = UIColor.mmWhiteIce
        inflationRateTextField.backgroundColor = UIColor.mmDarkGreen
        inflationRateTextField.textColor = UIColor.mmWhiteIce
        investmentReturnTextField.backgroundColor = UIColor.mmDarkGreen
        investmentReturnTextField.textColor = UIColor.mmWhiteIce

        
    
        view.backgroundColor = UIColor.mmDarkGreen
        calculateButton.layer.borderColor = UIColor.mmDarkGreen.cgColor
        calculateButton.layer.cornerRadius = 5
        calculateButton.layer.borderWidth = 1.0
        calculateButton.backgroundColor = UIColor.mmTealBlue
        calculateButton.tintColor = UIColor.mmWhiteIce
        navigationController?.navigationBar.tintColor = UIColor.mmWhiteIce

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.title = "FIRE Calculator"

        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.mmWhiteIce]
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.mmWhiteIce]


        if let navFrame = self.navigationController?.navigationBar.frame {
            
            //HERE
            //Create a new frame with the default offset of the status bar
            let newframe = CGRect(origin: .zero, size: CGSize(width: navFrame.width, height: (navFrame.height + UIApplication.shared.statusBarFrame.height) ))
            
            let image = gradientWithFrametoImage(frame: newframe, colors: [UIColor.mmTealBlue.cgColor, UIColor.mmlightForestGreen.cgColor])!
            
            self.navigationController?.navigationBar.barTintColor = UIColor(patternImage: image)
            
        }
        
//        setupLogo()
        

    }
    
    func setupLogo() {
//        let button = UIButton.init(type: .custom)
//        button.setImage(UIImage.init(named: "FireWhiteIcon"), for: UIControlState.normal)
//        button.frame = CGRect.init(x: 0, y: 0, width: 30, height: 40)
//        let barButton = UIBarButtonItem.init(customView: button)
//        self.navigationItem.rightBarButtonItem = barButton
//        barButton.isEnabled = false
    }
    
    func gradientWithFrametoImage(frame: CGRect, colors: [CGColor]) -> UIImage? {
        let gradient: CAGradientLayer  = CAGradientLayer(layer: self.view.layer)
        gradient.frame = frame
        gradient.colors = colors
        UIGraphicsBeginImageContext(frame.size)
        gradient.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    var ageOfRetirment = 0
    var year = 0
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        if (ageTextField.text?.isEmpty)! || (annualIncomeTextField.text?.isEmpty)! || (annualSavingsRateTextField.text?.isEmpty)! || (yearlyExpensesTextField.text?.isEmpty)! || (totalSavingsTextField.text?.isEmpty)! || (withdrawalRateTextField.text?.isEmpty)! || (inflationRateTextField.text?.isEmpty)! || (investmentReturnTextField.text?.isEmpty)! {
            //display alert message
            DispatchQueue.main.async {
                self.presentSimpleAlert(title: "oops", message: "all textfields required")
            }
            return
        }
        
        retirementCalculationFunction { (true) in
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "toResults", sender: self)
            }
        }
      
    }

    func retirementCalculationFunction(completion: @escaping(_ success: Bool) -> Void) {
        guard var totalSavings = Int(totalSavingsTextField.text!) else { return }
        guard let annualIncome = Int(annualIncomeTextField.text!) else { return }
        let annualSavingsRate = Double(annualSavingsRateTextField.text!)! / 100.0
        let annualDollarsSaved = Int(Double(annualIncome) * (annualSavingsRate))
        let yearlyExpenses = Int(yearlyExpensesTextField.text!)
        let withdrawalRate = 4.0 / 100.0
        let financialIndependenceNumber = Int((Double(yearlyExpenses!)) / withdrawalRate)
        let portfolioPercentageRate = 8.0 / 100.0
        var year = 0
        
        while totalSavings < financialIndependenceNumber {
            year += 1
            let investedBalance = totalSavings + annualDollarsSaved
            let amountPercentageToAdd = Int(portfolioPercentageRate * Double(investedBalance))
            let yearEndTotalSavings = amountPercentageToAdd + investedBalance
            totalSavings = yearEndTotalSavings
            print(year)
        }
        let ageAtRetirement = year + Int(ageTextField.text!)!
        self.ageOfRetirment = ageAtRetirement
        self.year = year
        completion(true)
        
    }
    
    // Simple Alert
    
    func presentSimpleAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismisss", style: .cancel, handler: nil)
        alert.addAction(dismissAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResults" {
            let resultsVC = segue.destination as? ResultsViewController
            let ageOfRetirement = self.ageOfRetirment
            resultsVC?.age = ageOfRetirment
            resultsVC?.year = year
        }
    }
}

extension AboutYourFinancesViewController: UITextFieldDelegate {

    //     Texfields can only be numbers for the number ones

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
      
        if textField == ageTextField {
        let maxLength = 2
        let currentString: NSString = textField.text! as NSString
        
        let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
        let noLetters = string.rangeOfCharacter(from: invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
            
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength && noLetters
        }

        if textField == annualIncomeTextField {
            let maxLength = 9
            let currentString: NSString = textField.text! as NSString
            let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
            
            let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
            let noLetters = string.rangeOfCharacter(from: invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
            
            return newString.length <= maxLength && noLetters
        }
        if textField == annualSavingsRateTextField {
            let maxLength = 3
            let currentString: NSString = textField.text! as NSString
            let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
            
            let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
            let noLetters = string.rangeOfCharacter(from: invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
            
            return newString.length <= maxLength && noLetters
            
            
        }
        if textField == yearlyExpensesTextField {
            let maxLength = 9
            let currentString: NSString = textField.text! as NSString
            let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
            
            let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
            let noLetters = string.rangeOfCharacter(from: invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
            
            return newString.length <= maxLength && noLetters
        }
        if textField == totalSavingsTextField {
            let maxLength = 9
            let currentString: NSString = textField.text! as NSString
            let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
            
            let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
            let noLetters = string.rangeOfCharacter(from: invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
            
            return newString.length <= maxLength && noLetters
        }
        if textField == withdrawalRateTextField {
            let maxLength = 3
            let currentString: NSString = textField.text! as NSString
            let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
            
            let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
            let noLetters = string.rangeOfCharacter(from: invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
            
            return newString.length <= maxLength && noLetters
        }
        if textField == inflationRateTextField {
            let maxLength = 3
            let currentString: NSString = textField.text! as NSString
            let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
            
            let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
            let noLetters = string.rangeOfCharacter(from: invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
            
            return newString.length <= maxLength && noLetters
        }
        if textField == investmentReturnTextField {
            let maxLength = 2
            let currentString: NSString = textField.text! as NSString
            let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
            
            let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
            let noLetters = string.rangeOfCharacter(from: invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
            
            return newString.length <= maxLength && noLetters
        }
        return true
    }
    
//    func textField(_ textField: UITextField,
//                   shouldChangeCharactersIn range: NSRange,
//                   replacementString string: String) -> Bool {
//        return (textField.text?.count ?? 0) < 2 || string == ""
//    }
    
    }
