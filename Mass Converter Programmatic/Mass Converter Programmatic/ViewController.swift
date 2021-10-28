//
//  ViewController.swift
//  Mass Converter Programmatic
//
//  Created by Majed Alshammari on 21/03/1443 AH.
//

import UIKit


enum ConversionType {
    case KG
    case Pound
}

class ViewController: UIViewController,UITextFieldDelegate {
    var conversionType = ConversionType.KG
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
    }
    
    
    let massTitle:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Mass Converter"
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        
       return label
    }()
    
    let seg:UISegmentedControl = {
    let item = ["KG", "Pounds"]
    let segmentControl = UISegmentedControl(items: item)
    segmentControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentControl
    }()
    
    let convLabel:UILabel = {
    let conversionLabel = UILabel()
    conversionLabel.text = "0.0"
    conversionLabel.font = UIFont.boldSystemFont(ofSize: 20)
    conversionLabel.textColor = .systemGreen
    conversionLabel.translatesAutoresizingMaskIntoConstraints = false
        return conversionLabel
    }()
    
    let intextField:UITextField = {
    let inputTextField = UITextField()
    inputTextField.placeholder = "0.0"
    inputTextField.keyboardType = .numberPad
    inputTextField.translatesAutoresizingMaskIntoConstraints = false
      return inputTextField
    }()
    
    
    fileprivate func setupViews() {
        view.addSubview(massTitle)
        view.addSubview(seg)
        view.addSubview(convLabel)
        view.addSubview(intextField)
        intextField.delegate = self
        
        massTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        massTitle.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        
        
        seg.topAnchor.constraint(equalTo: massTitle.safeAreaLayoutGuide.bottomAnchor,constant: 30).isActive = true
        seg.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        
        convLabel.topAnchor.constraint(equalTo: seg.safeAreaLayoutGuide.bottomAnchor,constant: 30).isActive = true
        convLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        
        intextField.topAnchor.constraint(equalTo: convLabel.safeAreaLayoutGuide.bottomAnchor,constant: 30).isActive = true
        intextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor,constant: -30) .isActive = true
        intextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        
        seg.addTarget(self, action: #selector(segmentAction( _ :)), for: .valueChanged)
        
        intextField.addTarget(self, action: #selector(inputTextAction(_ :)), for: .editingChanged)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissTap))
        view.addGestureRecognizer(tap)
        setupViews()
    }
    
    @objc func dismissTap() {
        intextField.resignFirstResponder()
    }
    
        func convertToKG( pound : Double) -> Double{
            
            return pound*2.2
        }
        
        func convertToPound( kg : Double) -> Double{
            
            return kg*0.45
        }
        
       @objc func inputTextAction(_ sender: UITextField) {
            
            var amountValue = 0.0
            let double = Double(intextField.text ?? "0")
            amountValue = double ?? 0
            
            switch conversionType {
            case .KG:
                let convertedValue = convertToKG(pound: amountValue)
                
                convLabel.text = "\(String(format: "%.2f", convertedValue)) Pounds"
            case .Pound:
                let convertedValue = convertToPound(kg: amountValue)
                
                convLabel.text = "\(String(format: "%.2f", convertedValue)) KG"
                
            }
            
        }
        
        
        @objc func segmentAction(_ sender: UISegmentedControl) {
            intextField.text = ""
           
            switch seg.selectedSegmentIndex {
            case 0: conversionType = .KG
                convLabel.text = "0.0 Pounds"
            case 1: conversionType = .Pound
                convLabel.text = "0.0 KG"
            default:
                convLabel.text = "0.0 Pounds"


            }
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            
            if intextField.text!.count > 5 && string.count > 0 {
                return false
            }
            else {
                return true
            }
        }
    
}



