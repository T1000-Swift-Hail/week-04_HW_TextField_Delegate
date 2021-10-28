//
//  ViewController.swift
//  Mass Converter Programmatic
//
//  Created by Dalal AlSaidi on 22/03/1443 AH.
//


import UIKit

enum ConversionType {
    case KG
    case Pound
}

class ViewController: UIViewController, UITextFieldDelegate,UITextViewDelegate {
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.lightGray
    }
    
    var typeOfMass : UISegmentedControl!
    var massConverter : UILabel!
    let massType = ["KG","Pound"]
    var conversionLabel : UILabel!
    var inputTextField : UITextField!
    var conversionType = ConversionType.KG
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        massConverter = UILabel()
        typeOfMass = UISegmentedControl(items: massType)
        conversionLabel = UILabel()
        inputTextField = UITextField()
        view.addSubview(massConverter)
        view.addSubview(conversionLabel)
        view.addSubview(typeOfMass)
        view.addSubview(inputTextField)
        
        // MARK: - Title label view setUp
        massConverterLabel()
        // MARK: - Result Label view setUp
        convertionResultLabel()
        // MARK: - Segmented Control view setUp
        segmentedControlFunc()
        // MARK: - Text Field input view setUp
        textFieldFunc()
        // MARK: - Dismiss keyboard when tap in screen
        dismissKeyboardFunc()
    }
    
    fileprivate func massConverterLabel() {
        massConverter.text = "Mass Converter"
        massConverter.font =  UIFont.boldSystemFont(ofSize: 32)
        massConverter.textAlignment = .center
        massConverter.translatesAutoresizingMaskIntoConstraints = false
        massConverter.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 120).isActive = true
        massConverter.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
    
    fileprivate func segmentedControlFunc() {
        typeOfMass.tintColor = .black
        typeOfMass.backgroundColor = .white
        typeOfMass.translatesAutoresizingMaskIntoConstraints = false
        typeOfMass.topAnchor.constraint(equalTo: massConverter.bottomAnchor, constant: 20).isActive = true
        typeOfMass.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        typeOfMass.addTarget(self, action: #selector(controlValueChange(_ :)), for: .valueChanged)
    }
    
    fileprivate func convertionResultLabel() {
        conversionLabel.font = UIFont.boldSystemFont(ofSize: 20)
        conversionLabel.text = "0.0 Pound"
        conversionLabel.textAlignment = .center
        conversionLabel.textColor = .red
        conversionLabel.translatesAutoresizingMaskIntoConstraints = false
        conversionLabel.topAnchor.constraint(equalTo: typeOfMass.bottomAnchor,constant: 80).isActive = true
        conversionLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
    
    fileprivate func textFieldFunc() {
        inputTextField.delegate = self
        inputTextField.translatesAutoresizingMaskIntoConstraints = false
        inputTextField.placeholder = "0.0"
        inputTextField.keyboardType = .numberPad
        inputTextField.backgroundColor = .white
        inputTextField.borderStyle = .roundedRect
        inputTextField.topAnchor.constraint(equalTo: conversionLabel.bottomAnchor, constant: 50).isActive = true
        inputTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        inputTextField.addTarget(self, action: #selector(controlEditChange(_ :)), for: .editingChanged)
    }
    
    fileprivate func dismissKeyboardFunc() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func controlValueChange(_ : UISegmentedControl){
        inputTextField.text = ""
        
        switch (typeOfMass.selectedSegmentIndex){
        case 0 : conversionType = .KG
            conversionLabel.text = "0.0 Pounds"
        case 1 : conversionType = .Pound
            conversionLabel.text = "0.0 KG"
        default :
            conversionType = .KG
            conversionLabel.text = "0.0 Pounds"
        }
    }
    
    @objc func controlEditChange (_ : UITextField){
        var amountValue = 0.0
        amountValue = Double(inputTextField.text ?? "0.0") ?? 0.0
        switch conversionType{
        case .KG :
            let convertedValue = convertToKG(pound: amountValue)
            conversionLabel.text = "\(String(format: "%.2f", convertedValue)) Pounds"
        case .Pound:
            let convertedValue = convertToPound(kg: amountValue)
            conversionLabel.text = "\(String(format: "%.3f", convertedValue)) KG"
        }
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        
        if (inputTextField.text?.count ?? 0) > 6 && string.count > 0{
            return false
        } else {
            return true
        }
    }
    
    func convertToKG( pound : Double) -> Double{
        return pound * (2.2)
    }
    
    func convertToPound( kg : Double) -> Double{
        return kg * 0.45
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

