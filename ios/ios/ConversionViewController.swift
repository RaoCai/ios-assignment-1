//
//  ConversionViewController.swift
//  ios
//
//  Created by user264175 on 9/15/24.
//

import UIKit

class ConversionViewController: UIViewController {

    @IBOutlet weak var conversionSelector: UISegmentedControl!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var convertButton: UIButton!
    
    
    
    var currentNumber: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "0"
    }
    
    // reaction for tapping number
        @IBAction func numberTapped(_ sender: UIButton) {
            if let numberValue = sender.titleLabel?.text {
                if currentNumber.count < 10 {
                    currentNumber += numberValue
                    updateDisplay()
                }
            }
        }
        
        // reaction for tapping .
        @IBAction func decimalTapped(_ sender: UIButton) {
            if !currentNumber.contains(".") {
                if currentNumber.isEmpty {
                    currentNumber = "0."
                } else {
                    currentNumber += "."
                }
                updateDisplay()
            }
        }
        
        // reaction for tapping clear
        @IBAction func clearTapped(_ sender: UIButton) {
            currentNumber = ""
            updateDisplay()
        }
        
        // update display
        func updateDisplay() {
            resultLabel.text = currentNumber.isEmpty ? "0" : currentNumber
        }
        
        // convert the number
        @IBAction func convertTapped(_ sender: UIButton) {
            calculateAndDisplayResult()
        }
        
        // converstion
        func calculateAndDisplayResult() {
            guard let number = Double(currentNumber) else {
                resultLabel.text = "convertion failed"  //
                return
            }
            
            if conversionSelector.selectedSegmentIndex == 0 {
                resultLabel.text = "\(number * 25.4) mm"  //
            } else {
                resultLabel.text = "\(number / 25.4) in"  //
            }
        }
    
    @IBAction func showVieController(_ sender: UIButton) {
        performSegue(withIdentifier: "showScroll", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showScroll" {
        }
    }
}
