//
//  ViewController.swift
//  Mass Converter
//
//  Created by Seham الشطنان on 20/03/1443 AH.
//

import UIKit


enum ConversionType {
    case KG
    case pound
    
}


class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var conversionLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    var conversionType = ConversionType.KG
    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        inputTextField.delegate = self
        let tap = UITapGestureRecognizer(target: Self.self, action:
                                    #selector(dismisskey))
        view.addGestureRecognizer(tap)
    }
    
    
    @objc func dismisskey (){
        inputTextField.resignFirstResponder()
    }
    
    @IBAction func changeTextValue(_ sender: Any) {
        
        var amountvalue = 0.0
        
        let userText = inputTextField.text ?? "0.0"
        let userTextDouble = Double(userText) ?? 0.0
        
        
    }
    
    
    @IBAction func segment(_ sender: Any) {
        inputTextField.text = ""
        
        switch  segmentControl.selectedSegmentIndex {
        case 0:
            conversionType = .KG
            conversionLabel.text = "0.0 pounds"
            
        case 1:
            conversionType = .pound
            conversionLabel.text = "0.0 KG"
            
        default :
            conversionType = .KG
            conversionLabel.text = "0.0 pounds"
            
            
            
        }
    }
    
    
    
    func convertToKG (pound :Double) -> Double {
        return pound*2.2
    }
    
    func converTopound( KG : Double) ->Double {
        
        return KG*0.45
        
    }
    
    @IBAction func textFiled(_ sender: Any) {
        var amountValue = 0.0
        switch conversionType {
        case .KG:
            let convertedValue =
            convertToKG(pound: amountValue)
            conversionLabel.text = "\(convertedValue) Pounds"
            
        case .pound :
            let convertedValue =
            converTopound(KG: amountValue)
            conversionLabel.text = "\(convertedValue) KG"
        }
    }
    
    func textField(_ textField: UITextField,shouldChangeCharactersInrange: NSRange,replacementString string: String) -> Bool{
        
        if (inputTextField.text?.count ?? 0) > 6 {
            return false
        }else {
            return true
        }
        
        
    }
}

