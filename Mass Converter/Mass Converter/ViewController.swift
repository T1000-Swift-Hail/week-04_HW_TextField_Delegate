//
//  ViewController.swift
//  Mass Converter
//
//  Created by Asma on 26/10/2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var conversionType = ConversionType.KG
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputTextField.delegate = self
        
        //MARK: - Tap Gesture Recognizer , dismiss the keyboard when the user taps on the screen
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    //MARK: -
    
    
    
    @IBOutlet weak var conversionLabel: UILabel!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        
        inputTextField.text = ""
        
        switch segmentControl.selectedSegmentIndex {
        case 0:
            conversionType = .KG
            conversionLabel.text = "0.0 Pounds"
        case 1:
            conversionType = .Pound
            conversionLabel.text = "0.0 KG"
        default:
            conversionType = .KG
            conversionLabel.text = "0.0 Pounds"
        }
    }
    
    
    func convertToKG( pound : Double) -> Double{
        return pound*2.2
    }
    func convertToPound( kg : Double) -> Double{
        return kg*0.45
    }
    
    
    @IBAction func textFieldAction(_ sender: UITextField) {
        
        let amountValue = Double(inputTextField.text ?? "0.0") ?? 0.0
        
        switch conversionType {
        case .KG:
            let convertedValue = convertToKG(pound: amountValue)
            conversionLabel.text = "\(String(format: "%.3f", convertedValue)) Pounds"
            
        case .Pound:
            let convertedValue = convertToPound(kg: amountValue)
            conversionLabel.text = "\(String(format: "%.2f", convertedValue)) KG"
        }
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //let charsCount = inputTextField.text?.count ?? 0
        
        if let charsCount = inputTextField.text?.count, charsCount < 6 {
            return true
        }
        else {
            return false
        }
    }
    
    
}
