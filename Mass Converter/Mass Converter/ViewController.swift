//
//  ViewController.swift
//  Mass Converter
//
//  Created by Hind Alharbi on 10/26/21.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate, UIGestureRecognizerDelegate{
    
    @IBOutlet weak var conversionLabel: UILabel!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    enum ConversionType {
        case KG
        case Pound
    }
    var conversionType = ConversionType.KG
    
    @IBAction func segmentControl1(_ sender: Any) {
        
        inputTextField.text = ""
        switch segmentControl.selectedSegmentIndex{
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
    
    @IBAction func inputTextField1(_ sender: Any) {
        
        var amountValue = 0.0
        
        amountValue = Double(inputTextField.text ?? "0.0") ?? 0.0
        
        switch conversionType {
        case .KG:
            let convertedValue = convertToKG(pound: amountValue)
            conversionLabel.text = "\(convertedValue) Pounds"
        case .Pound:
            let convertedValue = convertToPound(kg: amountValue)
            conversionLabel.text = "\(convertedValue) KG"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputTextField.delegate = self
        inputTextField.becomeFirstResponder()
        
        inputTextField.keyboardType = .numberPad
        
        // Do any additional setup after loading the view.
    }
    
    func convertToKG( pound : Double) -> Double{
        
        return pound*2.2
    }
    
    func convertToPound( kg : Double) -> Double{
        
        return kg*0.45
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        
        let textField1 = 6
        let textField = inputTextField.text?.count ?? 0
        if (textField < textField1) && (string.count > 0) || range.length > 0 {
            return true
        }else {
            return false
        }
    }
    
    // Extra
    @IBAction func clearKeyboard (){
        inputTextField.resignFirstResponder()
    }
}
