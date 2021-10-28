//
//  ViewController.swift
//  Mass Converter
//
//  Created by noyer altamimi on 20/03/1443 AH.
//

import UIKit


enum ConversionType {
    case KG
    case Pound
    
}

class ViewController: UIViewController,UITextFieldDelegate  {
    
    var conversionType = ConversionType.KG
    
    
    @IBOutlet weak var conversionLabel: UILabel!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    func convertToKG( pound : Double) -> Double{
        
        return pound*2.2
    }
    
    func convertToPound( kg : Double) -> Double{
        
        return kg*0.45
    }
    
    
    
    
    
    @IBAction func segmentedChanged(_ sender: Any) {
        
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        let tap = UITapGestureRecognizer( target: self , action: #selector(dismisskey))
        
        view.addGestureRecognizer(tap)
        inputTextField.delegate = self
    }
    
    func textField(_ textField: UITextField,shouldChangeCharactersIn rang:NSRange,replacementString string: String) -> Bool {
        if  inputTextField.text?.count ?? 0 >= 6 {
            //if  <= 6 { return true
            return false
        } else {
            return true
        }
    }
    
    
    @IBAction func textChanged(_ sender: Any) {
        
        var amountValue = 0.0
        let userText = inputTextField.text ?? "0.0"
        
        let userTextDouble = Double(userText) ?? 0.0
        
        
        
        switch conversionType {
        case .KG:
            let convertedValue = convertToKG(pound: userTextDouble)
            conversionLabel.text = "\(convertedValue) Pounds"
        case .Pound:
            let convertedValue = convertToPound(kg: userTextDouble)
            conversionLabel.text = "\(convertedValue) KG"
        }

    }
    
    @objc func dismisskey() {
        
        inputTextField.resignFirstResponder()
        
        
        
        
        
        
        
    }
}


