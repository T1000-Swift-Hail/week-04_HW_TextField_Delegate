//
//  ViewController.swift
//  Mass Converter
//
//  Created by Majed Alshammari on 20/03/1443 AH.
//

import UIKit

enum ConversionType {
    case KG
    case Pound
}

class ViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var conversionLabel: UILabel!
    
    var conversionType = ConversionType.KG
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissTap))
        
        view.addGestureRecognizer(tap)
        
        inputTextField.delegate = self
    }
    
    
    @objc func dismissTap() {
        inputTextField.resignFirstResponder()
    }
    
    
    func convertToKG( pound : Double) -> Double{
        
        return pound*2.2
    }
    
    func convertToPound( kg : Double) -> Double{
        
        return kg*0.45
    }
    
    @IBAction func inputTextAction(_ sender: UITextField) {
        
        var amountValue = 0.0
        let double = Double(inputTextField.text ?? "0")
        amountValue = double ?? 0
        
        switch conversionType {
        case .KG:
            let convertedValue = convertToKG(pound: amountValue)
            
            conversionLabel.text = "\(String(format: "%.2f", convertedValue)) Pounds"
        case .Pound:
            let convertedValue = convertToPound(kg: amountValue)
            
            conversionLabel.text = "\(String(format: "%.2f", convertedValue)) KG"
            
        }
        
    }
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        inputTextField.text = ""
        switch segmentControl.selectedSegmentIndex {
        case 0: conversionType = .KG
            conversionLabel.text = "0.0 Pounds"
        case 1: conversionType = .Pound
            conversionLabel.text = "0.0 KG"
        default:
            conversionLabel.text = "0.0 Pounds"
            
            
        }
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if inputTextField.text!.count > 5 && string.count > 0 {
            return false
        }
        else {
            return true
        }
    }
}

