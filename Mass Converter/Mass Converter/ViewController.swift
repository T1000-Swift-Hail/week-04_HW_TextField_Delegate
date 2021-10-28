//
//  ViewController.swift
//  Mass Converter
//
//  Created by Dalal AlSaidi on 21/03/1443 AH.
//

import UIKit
import Foundation


enum ConversionType {
    case KG
    case Pound
}

class ViewController: UIViewController, UITextFieldDelegate,UITextViewDelegate {
    
    @IBOutlet weak var conversionLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var massSegmented: UISegmentedControl!
    var conversionType = ConversionType.KG
    
    @IBAction func massSegmentedController(_ sender: Any) {
        
        inputTextField.text = ""
        
        switch (massSegmented.selectedSegmentIndex){
        case 0 : conversionType = .KG
            conversionLabel.text = "0.0 Pounds"
        case 1 : conversionType = .Pound
            conversionLabel.text = "0.0 KG"
        default :
            conversionType = .KG
            conversionLabel.text = "0.0 Pounds"
        }
    }
    
    @IBAction func textFeild(_ sender: Any) {
        
        var amountValue = 0.0
        amountValue = Double(inputTextField.text ?? "0.0") ?? 0.0
        switch conversionType{
        case .KG :
            let convertedValue = convertToKG(pound: amountValue)
            conversionLabel.text = "\(String(format: "%.2f", convertedValue)) Pounds"
        case .Pound:
            let convertedValue = convertToPound(kg: amountValue)
            conversionLabel.text = "\(String(format: "%.3f", convertedValue)) KG"
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        
        let textLenghth = 6
        let countText = inputTextField.text as NSString?
        guard (countText?.replacingCharacters(in: range, with: string).count)! <= textLenghth
                
        else {
            return false }
        
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.delegate = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func convertToKG( pound : Double) -> Double{
        return pound * (2.2)
    }
    
    func convertToPound( kg : Double) -> Double{
        return kg * 0.45
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


