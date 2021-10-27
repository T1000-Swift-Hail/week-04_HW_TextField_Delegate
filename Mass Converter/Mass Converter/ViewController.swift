//
//  ViewController.swift
//  Mass Converter
//
//  Created by mac on 21/03/1443 AH.
//
import UIKit
enum ConversionType {
  case KG
  case Pound
}
class ViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate {
  @IBOutlet weak var segmentControl: UISegmentedControl!
  @IBOutlet weak var inputTextField: UITextField!
  @IBOutlet weak var conversionLabel: UILabel!
  var tap = UITapGestureRecognizer()
  var conversionType = ConversionType.KG
  override func viewDidLoad() {
    super.viewDidLoad()
    tap = UITapGestureRecognizer(target: self, action: #selector(confert))
    view.addGestureRecognizer(tap)
    inputTextField.text = ""
    inputTextField.delegate = self
  }
  @IBAction func converting(_ sender: UITextField) {
    if let doubleText = Double(inputTextField.text ?? "0.0") {
      amountValue(amount: doubleText, conversionType: conversionType)
    }
  }
  @objc func confert() {
    inputTextField.resignFirstResponder()
  }
  func amountValue(amount:Double,conversionType:ConversionType) {
   
      
    switch conversionType {
    case .KG:
      let convertedValue = convertToKG(pound:amount)
      print("KG")
      conversionLabel.text = "\(convertedValue) Pounds"
    case .Pound:
      print("Pound")
      let convertedValue = convertToPound(kg: amount)
      conversionLabel.text = "\(convertedValue) KG"
    }
  }
  @IBAction func segmentChangeValue(_ sender: Any) {
    inputTextField.text = ""
    switch segmentControl.selectedSegmentIndex{
    case 0: conversionType = .KG
      conversionLabel.text = "0.0 Pounds"
    case 1: conversionType = .Pound
      conversionLabel.text = "0.0 KG"
    default: conversionType = .KG
      conversionLabel.text = "0.0 Pounds"
    }
  }
  func convertToKG( pound : Double) -> Double{
    return pound * 2.2
  }
  func convertToPound( kg : Double) -> Double{
    return kg * 0.45
  }
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
    print("range.length:\(range.length)")
    if ((textField.text?.count ?? 0) > 6 && string.count > 0) {
      return false
    } else {
      return true
    }
  }
}
