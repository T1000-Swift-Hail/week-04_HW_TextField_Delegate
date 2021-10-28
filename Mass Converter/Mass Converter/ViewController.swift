//
//  ViewController.swift
//  Mass Converter
//
//  Created by Hesah Alqhtani on 26/10/2021.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate {


    @IBOutlet weak var conversionLabel: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    enum ConversionType {
       case KG
       case Pound
      }
    var conversionType = ConversionType.KG


    @IBAction func SegmentedControll(_ sender: Any) {
        inputTextField.text = ""
        
        switch segmentControl.selectedSegmentIndex {
        
           
       case 0: conversionType = .KG
           conversionLabel.text = "0.0 Pounds"
           
        case 1: conversionType = .Pound
            conversionLabel.text = "0.0 KG"
           
        default: conversionType = .KG
            conversionLabel.text = "0.0 Pounds"
           
       }
       
            
            
        
        
    
    }
    
    @IBAction func inputTextField1(_ sender: Any){
    
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
        
        segmentControl.becomeFirstResponder()
        // Do any additional setup after loading the view.
        
        inputTextField.delegate = self
    }

    func convertToKG( pound : Double) -> Double{
      
      return pound*2.2
    }

    func convertToPound( kg : Double) -> Double{
      
      return kg*0.45
    
    }
    func textField (_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        
        let numberInput = inputTextField.text? .count ?? 0
        if numberInput <= 5 {
            return true
        }else{
        return false
        }
        
        
        
            
            
    }
    
    
    @IBAction func dismissKB(_ sender: UITapGestureRecognizer) {
        inputTextField.resignFirstResponder()
    }
    
}
    
    
        
        
        
        
        
        
    
    
    


