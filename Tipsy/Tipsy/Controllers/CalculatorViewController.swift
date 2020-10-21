//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var bill: Float?
    var selectedTip: String?
    
    @IBAction func tipChanged(_ sender: UIButton) {
        // give button a bg so it appears selected by setting isSelected to be true
        
        sender.isSelected = true // user's selection
        selectedTip = sender.currentTitle
        
        // make sure other buttons besides the sender aren't selected
        if sender == zeroPctButton {
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        } else if sender == tenPctButton {
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
        } else {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
        }
        
        billTextField.endEditing(true)
            
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = Int(sender.value).description // increase/decrease split number label depending on whether + or - was pressed
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let amt = Float(billTextField.text!)
        let split = Float(splitNumberLabel.text!)
        if zeroPctButton.isSelected {
            bill = amt ?? 0.0 / split!
        } else if tenPctButton.isSelected {
            bill = (amt ?? 0.0) * 1.10 / split!
        } else {
            bill = (amt ?? 0.0) * 1.20 / split!
        }
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let dest = segue.destination as! ResultsViewController
            dest.bill = bill
            dest.settings = "Split between \(splitNumberLabel.text!) people, with a \(selectedTip!) tip."
        }
    }
    
}

