//
//  ViewController.swift
//  Mass Converter Programmatic
//
//  Created by Asma on 27/10/2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let view = UIView()
        view.backgroundColor = .white
        
        //MARK: -  add Label text Mass Converter
        
        let labelMass = UILabel()
        labelMass.text = "Mass Converter"
        labelMass.frame = CGRect(x: 100, y: 150, width: 200, height: 20)
        labelMass.textAlignment = .center
        labelMass.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelMass)
        self.view = view
        
        //MARK: -  add segmented Control kg and pound
        
        let items = ["KG", "Pound"]
        let segmentedControl = UISegmentedControl(items : items)
        segmentedControl.center = self.view.center
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(ViewController.indexChanged(_:)), for: .valueChanged)
        segmentedControl.layer.cornerRadius = 5.0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.frame = CGRect(x: 100, y: 200, width: 200, height: 20)
        self.view.addSubview(segmentedControl)
        
        //MARK: -  add Label 0.0 POUND
        
        let label = UILabel()
        label.text = "0.0 Pound"
        label.frame = CGRect(x: 100, y: 250, width: 200, height: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        self.view = view
        //MARK: -  add text field
        
        let textField = UITextField()
        textField.placeholder = "0.0"
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        textField.frame = CGRect(x: 100, y: 300, width: 200, height: 20)
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)
        self.view = view
        
    }

    
    
    
    @objc func indexChanged (_ sender: UISegmentedControl){
        switch sender.selectedSegmentIndex {
        case 0:
            print("KG")
        case 1:
            print("Pound")
        default:
            break
        }
    }

}
    
