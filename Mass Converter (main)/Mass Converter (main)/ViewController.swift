//
//  ViewController.swift
//  Mass Converter (main)
//
//  Created by Ahmed Alenazi on 21/03/1443 AH.
//

import UIKit
enum ConversionType {
    case KG
    case Pound
}



class ViewController: UIViewController , UITextFieldDelegate {
    @IBOutlet weak var conversionLabel: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var inputTextField: UITextField!
    
    var conversionType = ConversionType.KG
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: important for condi
        inputTextField.delegate = self
    }
    @IBAction func SegmentedControl(_ sender: Any) {
        
        inputTextField.text = ""
        
        switch segmentControl.selectedSegmentIndex{
            
            
        case 0:
            conversionType = .KG ; conversionLabel.text = "0.0 Pounds"
        case 1:
            conversionType = .Pound ; conversionLabel.text = "0.0 KG"
        default:
            conversionType = .KG ; conversionLabel.text = "0.0 Pounds"
            
            
            
        }
        
        
    }
    func convertToKG( pound : Double) -> Double{
        
        return pound*2.2
    }
    
    func convertToPound( kg : Double) -> Double{
        
        return kg*0.45
    }
    
    @IBAction func tt(_ sender: Any) {
        
        let amountValue = Double(inputTextField.text ?? "0.0") ?? 0.0
        
        switch  conversionType{
            
        case .KG:
            let convertedValue = convertToKG(pound: amountValue)
            conversionLabel.text = "\(convertedValue) Pounds"
            
            
        case .Pound:
            let convertedValue = convertToPound(kg: amountValue)
            conversionLabel.text = "\(convertedValue) KG"
        }
        
    }
    
    
    
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
            let currentText = textField.text ?? ""
    
    
            guard let stringRange = Range(range, in: currentText) else { return false }
    
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
    
            return updatedText.count <= 6
    
    
    
    }
    }
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
//        if (inputTextField.text?.count ?? 0 ) <= 6 {
//
//            return true
//
//        } else { return false
//
//        }
//
//
//    }
//}
//


