//
//  ViewController.swift
//  Mass Converter
//
//  Created by mona aleid on 21/03/1443 AH.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate{
    @IBOutlet weak var conversionLabel: UILabel!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    enum ConversionType {
       case KG
       case Pound
      }
    var conversionType = ConversionType.KG
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.inputTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ inputTextField: UITextField) -> Bool {
        return inputTextField.resignFirstResponder()
        
    }

    
    
@IBAction func Segment1(_ sender: UISegmentedControl) {
        inputTextField.text = ""
        
        switch segmentControl.selectedSegmentIndex{
        case 0: conversionType = .KG
            conversionLabel.text = "0.0 Pounds"
            
        case 1: conversionType = .Pound
            conversionLabel.text = "0.0 KG"
            
        default: conversionType = .KG
            conversionLabel.text = "0.0 Pounds"
        }
        }
        func convertToKG( pound : Double) -> Double{
          
          return pound*2.2
        }

        func convertToPound( kg : Double) -> Double{
          
          return kg*0.45
        }

        
   
    @IBAction func TextfieldaAcion(_ sender: Any) {
    
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
    
    func textFieldDidEndEditing(_ textField: UITextField,shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let resultTextField = inputTextField.text?.count ?? 0
        if (resultTextField == 6 ){
            return true
    }
        else{
            return false
        }
    
}
    
}

