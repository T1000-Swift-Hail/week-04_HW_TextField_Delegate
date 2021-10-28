//
//  ViewController.swift
//  Mass Converter
//
//  Created by Hana Alshmmri on 26/10/2021.
//

import UIKit

enum ConversionType {
    case KG
    case Pound
    
}
class ViewController:
    UIViewController {
    var conversionType = ConversionType.KG
    @IBOutlet weak var conversionLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var segmentControl: UISegmentedControl!


override func viewDidLoad() {
    super.viewDidLoad()
}
    
    
    @IBAction func SegmentedAction(_ sender : Any){
    
    inputTextField.text = ""
    
    switch  segmentControl.selectedSegmentIndex {
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
    func convertToKG(Pound: Double) -> Double {
        return Pound*2.2
    }
    func convertToPound(KG: Double) -> Double {
        return KG*0.45
    }
    

    @IBAction func editingchanged(_ sender: Any) {
        
        var amountValue = Double(inputTextField.text ?? "0.0") ?? 0
        
        switch conversionType {
        case .KG:
            let convertedValue = convertToKG(Pound: amountValue)
            conversionLabel.text = "\(convertedValue) Pounds"
        case .Pound:
            let convertedValue = convertToPound(KG: amountValue)
            conversionLabel.text = "\(convertedValue) KG"


        }
        
        
    }
    
    
func textField(_textField:UITextField,shuldChangeCaractersIn range :NSRange ,replacementstring string :String ) -> Bool {
        
        if inputTextField.text!.count < 6 {
            return true
        }
        
        else {
            return false
        }
    }
    
}


