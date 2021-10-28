//
//  ViewController.swift
//  Mass Converter
//
//  Created by Mohammed Abdullah on 20/03/1443 AH.
//

import UIKit

enum ConversionType {
   case KG
   case Pound
    

  }

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var conversionLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
      var conversionType = ConversionType.KG
      var segmentedControlView : UISegmentedControl!
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            inputTextField.delegate = self
            
    }
   
  
    
    @IBAction func valuechange(_ sender: UISegmentedControl) {
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
    
    
    
    @IBAction func editingChanged(_ sender: Any) {
    
        let amount = Double(inputTextField.text ?? "0.0") ?? 0.0
              
              switch conversionType {
              case .KG:
                  let convertedValue = convertToKG(pound: amount)
                  conversionLabel.text = "\(convertedValue)pounds"
              case .Pound:
                  let convertedValue = convertToPound(kg: amount)
                  conversionLabel.text = "\(convertedValue) KG"
    }
        
    }
    
    
    func convertToKG( pound : Double) -> Double {
         
         return pound*2.2
     }
     
     func convertToPound( kg : Double) -> Double{
         
         return kg*0.45
         
     }

 
    func textField(_ textField: UITextField, shouldChangeCharactersIn shouldChangeCharactersInrange: NSRange, replacementString string: String) -> Bool{
           
           if (inputTextField.text?.count ?? 0) <= 6 {
               return true
           } else {
               //if ((textField.text?.count ?? 0) <= 6) {
                   return false
               //}
      }


    }
    
}
