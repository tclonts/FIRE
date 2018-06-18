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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var ageOfRetirment = 0
    var year = 0

    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        retirementCalculationFunction()
    }
    
    @IBAction func advancedOptionsButtonTapped(_ sender: UIButton) {
    }
    

    func retirementCalculationFunction() {
        guard var totalSavings = Int(totalSavingsTextField.text!) else { return }
        guard let annualIncome = Int(annualIncomeTextField.text!) else { return }
        guard let annualSavingsRate = Double(annualSavingsRateTextField.text!) else { return }
        let annualDollarsSaved = Int(Double(annualIncome) * (annualSavingsRate))
        let yearlyExpenses = Int(yearlyExpensesTextField.text!)
        let withdrawalRate = Double(withdrawalRateTextField.text!)
        let financialIndependenceNumber = Int((Double(yearlyExpenses!)) / withdrawalRate!)
        let portfolioPercentageRate = Double(investmentReturnTextField.text!)
        var year = 0
        
        while totalSavings < financialIndependenceNumber {
            year += 1
            let investedBalance = totalSavings + annualDollarsSaved
            let amountPercentageToAdd = Int(portfolioPercentageRate! * Double(investedBalance))
            let yearEndTotalSavings = amountPercentageToAdd + investedBalance
            totalSavings = yearEndTotalSavings
            print(year)
        }
        let ageAtRetirement = year + Int(ageTextField.text!)!
        self.ageOfRetirment = ageAtRetirement
        self.year = year
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultsVC" {
            let resultsVC = segue.destination as? ResultsViewController
            let ageOfRetirement = self.ageOfRetirment
            resultsVC?.age = ageOfRetirment
            resultsVC?.year = year
        }
    }
}
