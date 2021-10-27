//
//  ViewController.swift
//  Mass Converter
//
//  Created by موضي الحربي on 20/03/1443 AH.
//

import UIKit

enum ConversionType {
   case KG
  case Pound
}

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var conversionLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    var conversionType = ConversionType.KG
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        inputTextField.delegate = self
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismisskey))
        view.addGestureRecognizer(tap)
    }
   
    @objc func dismisskey(){
        inputTextField.resignFirstResponder()
}
        @IBAction func changing(_ sender: Any) {
        
        
        var amountValue = 0.0
       
        let usertext = inputTextField.text ?? "0.0"
        let usertextduble = Double(usertext) ?? 0.0
        
        switch conversionType {
            
        case .KG:
            let convertedValue = convertToKG(pound: usertextduble)
            conversionLabel.text = "\(convertedValue) Pounds"
            
            
        case .Pound:
            let convertedValue = convertToPound(kg: usertextduble)
            conversionLabel.text = "\(convertedValue) KG"

        }
    }
    
    
    @IBAction func segmentcontrol(_ sender: Any) {
    
        inputTextField.text = ""
        
        
        switch (segmentControl.selectedSegmentIndex) {
       
        case 0: conversionType = .KG
            conversionLabel.text = "0.0 Pounds"
        
        case 1:conversionType = .Pound
            conversionLabel.text = "0.0 KG"
        
         default :conversionType = .KG
   
            conversionLabel.text = "0.0 Pounds"
        }
    
    }
        func convertToKG( pound : Double) -> Double{
          
          return pound*2.2
        }

        func convertToPound( kg : Double) -> Double{
          
          return kg*0.45
        }
      
    

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool      {
   
    
      
        if inputTextField.text!.count < 6 {
            return true
        }
            
        else {
        
            return false
            }
    }

}

