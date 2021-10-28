//
//  ViewController.swift
//  Mass Converter
//
//  Created by HIND12 on 21/03/1443 AH.
//

import UIKit

enum ConversionType {
    case KG
    case Pound
}

class ViewController: UIViewController {
    
    @IBOutlet weak var conversionLabel: UILabel!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var inputTextField: UITextField!
    
    var conversionType = ConversionType.KG
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
    
    func convertToKG( pound : Double) -> Double{
        
        return pound*2.2
    }
    
    func convertToPound( kg : Double) -> Double{
        
        return kg*0.45
    }
    
    func textField( _textField: UITextField, shouldChangeCharactersIn rang: NSRange,replacementstring string: String)->Bool{
        let input = inputTextField.text?.count ?? 0
        if input <= 6 {return true
        } else {
            return false
        }
    }
    
    @IBAction func changTextvalue(_ sender: Any) {
        var amountvalue = 0.0
        amountvalue = Double (inputTextField.text ?? "0.0") ?? 0.0
        
        switch conversionType {
        case .KG:
            let convertedvalue = convertToPound(kg: amountvalue)
            conversionLabel.text = "\(convertedvalue) pounds"
            
        case .Pound:
            let convertedvalue = convertToPound(kg: amountvalue)
            conversionLabel.text = "\(convertedvalue) KG"
        }
    }


    

    
}





