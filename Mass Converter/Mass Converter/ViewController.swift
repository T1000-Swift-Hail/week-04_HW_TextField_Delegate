//
//  ViewController.swift
//  Mass Converter
//
//  Created by Monafh on 20/03/1443 AH.
//
import UIKit

enum ConversionType {
    case KG
    case Pound
}
class ViewController: UIViewController , UITextFieldDelegate {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var conversionLabel: UILabel!
    
    var conversionType = ConversionType.KG
    
    func convertToKG( pound : Double) -> Double{
        return pound*2.2
    }
    func convertToPound( kg : Double) -> Double{
        return kg*0.45
    }
    @IBAction func segmentControl(_ sender: Any) {
        
        inputTextField.text = ""
        
        switch (segmentControl.selectedSegmentIndex) {
        case 0:
            conversionType = .KG
            conversionLabel.text = "0.0 Pounds"
        case 1:
            conversionType = .Pound
            conversionLabel.text = "0.0 KG"
        default :
            conversionType = .KG
            conversionLabel.text = "0.0 Pounds"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.delegate = self
        inputTextField.text = ""
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissTap))
        view.addGestureRecognizer(tap)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        
        let ext = 6
        let  input =  inputTextField.text as NSString?
        
        guard (input?.replacingCharacters(in:range, with: string).count)! <= ext
                
        else { return false
        }
        return true
    }
    
   
    
    @IBAction func cofertingValue(_ sender: UITextField) {
        var amountValue = 0.0
        amountValue = Double( inputTextField.text ?? "0.0") ?? 0.0
        
        switch conversionType {
        case .KG:
            let convertedValue = convertToKG(pound: amountValue)
            conversionLabel.text = "\(String(format: "%.2f", convertedValue)) Pounds"
            
        case .Pound:
            let convertedValue = convertToPound(kg: amountValue)
            conversionLabel.text = "\(String(format: "%.3f", convertedValue)) KG"
            
        }
    }

    @objc func dismissTap() {
         view.endEditing(true)
     }
    
}
