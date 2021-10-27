//
//  ViewController.swift
//  Mass Converter
//
//  Created by Anas Hamad on 20/03/1443 AH.
//

import UIKit

enum ConversionType {
   case KG
   case Pound
  }
  

class ViewController: UIViewController, UITextFieldDelegate {
    
       

    @IBOutlet var welcome: UILabel!
    @IBOutlet weak var conversionLabel: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var inputTextField: UITextField!
    var conversionType = ConversionType.KG
    var amountValue : Double = 0.0
    
  
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.delegate = self
    }
    
    @IBAction func segmentAction(_ sender: Any) {
        switch segmentControl.selectedSegmentIndex{
        case 0:
            conversionType = .KG; conversionLabel.text = "0.0 Pounds"
        case 1:
            conversionType = .Pound; conversionLabel.text = "0.0 KG"
        default:
            conversionType = .KG; conversionLabel.text = "0.0 Pounds"}
        
    }
   
 
    @IBAction func TextAction(_ sender: Any ) {
        
        var amountValue = 0.0
        let d = Double(inputTextField.text ?? "0")
        amountValue = d  ?? 0
        
        switch conversionType {
        case .KG:
            let convertedValue = convertToKG(Pound: amountValue)
            conversionLabel.text = "\(convertedValue) Pound"
        case .Pound :
            let convertedValue = convertToPound(KG: amountValue)
            conversionLabel.text = "\(convertedValue) KG"
        }
        func convertToKG( Pound : Double) -> Double{
          
          return Pound*2.2
        }
      
        func convertToPound( KG : Double) -> Double{
          
          return KG*0.45
        }
        
      
            
        }
    
    
    

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{

//        if inputTextField.text?.count ?? 0 >= 6 {
//            return
//        }else {
//             return false
//        }
        let MaxTextLength = 6

        guard let preText = inputTextField.text as NSString?,
                    preText.replacingCharacters(in: range, with: string).count <= MaxTextLength else {
                    return false
                }
        
return true

}

}
