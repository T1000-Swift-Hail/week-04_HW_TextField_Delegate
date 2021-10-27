//
//  ViewController.swift
//  Mass Converter
//
//  Created by Asma Rasheed on 20/03/1443 AH.
//
import UIKit

enum ConversionType {
   case KG
   case Pound
  }

class ViewController: UIViewController ,UITextFieldDelegate {

    
    @IBOutlet weak var conversionLabel: UILabel!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
   
    
    func convertToKG( pound : Double) -> Double{
      
      return pound*2.2
    }

    func convertToPound( kg : Double) -> Double{
      
      return kg*0.45
    }
    
    
    var conversionType = ConversionType.KG
   
    
    @IBAction func ValueChanged(_ sender: Any) {
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
            
            
          
           // segmentControl.becomeFirstResponder()
            }

         
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.delegate = self
        // Do any additional setup after loading the view.
        inputTextField.text = ""
        
    
    }

    @IBAction func changeview (_ sender: Any) {
        
       var amountValue = 0.0
        amountValue =  Double(inputTextField.text ?? "0.0") ?? 0.0
        
        func confert() {
            inputTextField.resignFirstResponder()
          }
        
        switch conversionType {
            
        case .KG:
            let convertedValue = convertToKG(pound: amountValue)
            
            conversionLabel.text = "\(convertedValue) Pounds"
        case .Pound:
            let convertedValue = convertToPound(kg: amountValue)
            
            conversionLabel.text = "\(convertedValue) KG"

        }
        
    }
    
    func textField (_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       
        let numberInput = inputTextField.text?.count ?? 0
        if   numberInput <= 5 {
        return true
        }
            else {
                return false
            }
    }

    @objc func dismKeyboard () {
    }
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {        textField.resignFirstResponder()

}


   
}
