//
//  ViewController.swift
//  Mass Converter
//
//  Created by Mastorah on 26/10/2021.
//

import UIKit

enum ConversionType {
   case KG
   case Pound
  }

class ViewController: UIViewController , UITextFieldDelegate {

    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var conversionLabel: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBAction func inputTextField(_ sender: Any) {
    
        switch segmentControl.selectedSegmentIndex {
        case 0:  conversionType = .KG
            
            conversionLabel.text = "0.0 Pounds"
        case 1: conversionType = .Pound
            conversionLabel.text = "0.0 KG"
        default: conversionType = .KG
            conversionLabel.text = "0.0 Pounds"
                }
    }
    
    
     var conversionType = ConversionType.KG
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.delegate = self
        
        segmentControl.becomeFirstResponder()
   
    }
        
        
    
        // Do any additional setup after loading the view.

   



    func convertToKG( pound : Double) -> Double{
      
      return pound*2.2
    }

    func convertToPound( kg : Double) -> Double{
      
      return kg*0.45
    }
    
@IBAction func value(_ sender: Any) {
   
    var amountValue = 0.0
    amountValue = Double(inputTextField.text ?? "0.0") ?? 0.0
switch conversionType {
        case .KG:
let convertedValue = convertToKG(pound: amountValue); conversionLabel.text = "\(convertedValue) Pounds"
        case .Pound:
let convertedValue = convertToPound(kg: amountValue); conversionLabel.text = "\(convertedValue) KG"
            

        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
let number = inputTextField.text?.count ?? 0
if number < 6 {
return true
        } else {
return false
        }
}
}
