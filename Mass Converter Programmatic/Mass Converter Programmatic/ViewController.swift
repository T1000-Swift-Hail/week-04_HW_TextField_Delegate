//
//  ViewController.swift
//  Mass Converter Programmatic
//
//  Created by Monafh on 22/03/1443 AH.
//

import UIKit

enum ConversionType {
   case KG
   case Pound
  }

class ViewController: UIViewController , UITextFieldDelegate  {

 //
    var massConverterLabel : UILabel!
    var segmentControl : UISegmentedControl!
    var PoundLabel : UILabel!
    var inputTextField : UITextField!
    let weights = [" KG", "Pound"]
    var conversionType = ConversionType.KG

//    Label Mass Converter ......
   
    
//   segment KG , Pounds ....
   
//     func segmentControl(_ sender: Any) {
//
//        switch (segmentControl.selectedSegmentIndex) {
//        case 0:
//            conversionType = .KG
//            conversionLabel.text = "0.0 Pounds"
//        case 1:
//            conversionType = .Pound
//            conversionLabel.text = "0.0 KG"
//        default :
//            conversionType = .KG
//            conversionLabel.text = "0.0 Pounds"
//        }
//    }
    
//     Label 0.0 Pound .....
//    let PoundLabel: UILabel? = {

//        return PoundLabel
  
    
//    TexField input .......
  
    


    override func viewDidLoad() {
        
        super.viewDidLoad()
        massConverterLabel = UILabel()
        PoundLabel = UILabel()
        segmentControl = UISegmentedControl()
        inputTextField = UITextField()

        massConverterLabel.text = "Mass Converter"
        massConverterLabel.font = UIFont.systemFont(ofSize: 40)
        massConverterLabel.tintColor = .label
        massConverterLabel.translatesAutoresizingMaskIntoConstraints = false
//
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissTap))
        view.addGestureRecognizer(tap)
//
        segmentControl =  UISegmentedControl(items: weights)
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        
        PoundLabel.text = " 0.0 Pound "
        PoundLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        PoundLabel.translatesAutoresizingMaskIntoConstraints = false
        
        inputTextField.placeholder = "0.0"
        inputTextField.keyboardType = .numberPad
        inputTextField.translatesAutoresizingMaskIntoConstraints = false
        
        
//        massConverterLabel.delegate = self
//        segmentControl.delegate = self
//        PoundLabel.delegate = self
        inputTextField.delegate = self
        
        view.addSubview(massConverterLabel)
        view.addSubview(segmentControl)
        view.addSubview(PoundLabel)
        view.addSubview(inputTextField)
        
        
//        constraint ......
        massConverterLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150).isActive = true
        massConverterLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
//        massConverterLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor,constant: -10).isActive = true
        
        segmentControl.topAnchor.constraint(equalTo: massConverterLabel.safeAreaLayoutGuide.bottomAnchor,constant: 50).isActive = true
        segmentControl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        segmentControl.addTarget(self, action: #selector(segmentControl(_ :)), for: .valueChanged)

//        segmentControl.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor,constant: -70).isActive = true
        
        PoundLabel.topAnchor.constraint(equalTo: segmentControl.safeAreaLayoutGuide.topAnchor,constant: 70).isActive = true
        PoundLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true

        
        inputTextField.topAnchor.constraint(equalTo: PoundLabel.safeAreaLayoutGuide.topAnchor,constant: 160).isActive = true
//        inputTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
//        inputTextField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        inputTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        inputTextField.addTarget(self, action: #selector(textInputNumber(_ :)), for: .editingChanged)

    }
        


    @objc func segmentControl(_ sender: UITextField) {

    inputTextField.text = ""

    switch (segmentControl.selectedSegmentIndex) {
    case 0:
        conversionType = .KG
        PoundLabel.text = "0.0 Pounds"
    case 1:
        conversionType = .Pound
        PoundLabel.text = "0.0 KG"
    default :
        conversionType = .KG
        PoundLabel.text = "0.0 Pounds"
    }}
  
    @objc func textInputNumber(_ sender: UISegmentedControl) {
    var amountValue = 0.0
    amountValue = Double( inputTextField.text ?? "0.0") ?? 0.0

    switch conversionType {
    case .KG:
        let convertedValue = convertToKG(pound: amountValue)
        PoundLabel.text = "\(String(format: "%.2f", convertedValue)) Pounds"

    case .Pound:
        let convertedValue = convertToPound(kg: amountValue)
        PoundLabel.text = "\(String(format: "%.3f", convertedValue)) KG"

    }
     
 }


    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        
        let ext = 6
        let  input =  inputTextField.text as NSString?
        
        guard (input?.replacingCharacters(in:range, with: string).count)! <= ext
                
        else { return false
        }
        return true
    }

     @objc func dismissTap() {
     view.endEditing(true)
 }
   
func convertToKG( pound : Double) -> Double{
    return pound*2.2
}
func convertToPound( kg : Double) -> Double{
    return kg*0.45
    
}
}


