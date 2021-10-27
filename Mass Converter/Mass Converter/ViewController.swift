//
//  ViewController.swift
//  Mass Converter
//
//  Created by iAbdullah17 on 20/03/1443 AH.
//

import UIKit

enum ConversionType {
     case KG
     case Pound
}

class ViewController: UIViewController, UITextFieldDelegate {

 
      @IBOutlet weak var conversionLabel: UILabel!
      
      
      @IBOutlet weak var segmentControl: UISegmentedControl!
      
      @IBOutlet weak var inputTextField: UITextField!
      
      
   
      var conversionType = ConversionType.KG


    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
           inputTextField.delegate = self

          }
       
           @IBAction func segment(_ sender: Any) {
                  
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
      
      
      
       @IBAction func changedEditing(_ sender: Any) {
              
              var amountValue = 0.0
              
              amountValue = Double(inputTextField.text ?? "0.0") ?? 0.0
              switch conversionType {
              case .KG :
                     let convertedValue = convertToKG(pound: amountValue)
                     conversionLabel.text = "\(convertedValue) Pounds"



              case .Pound:
                     let convertedValue = convertToPound(kg: amountValue)
                     conversionLabel.text = "\(convertedValue) KG"


              }
              
              
       }
       
      func convertToKG( pound : Double) -> Double{
        
        return pound*2.2
      }

      func convertToPound( kg : Double) -> Double{
        
        return kg*0.45
      }
       
       
       func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {


              if textField.text!.count > 5 && string.count > 0 {
                     return false
              }
           else {
                     return true
              }

       }

}


  

