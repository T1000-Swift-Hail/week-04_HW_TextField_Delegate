
import UIKit

enum ConversionType {
    case KG
    case Pound
}

class ViewController :UIViewController, UITextFieldDelegate {
    

    
    @IBOutlet weak var conversionLabel: UILabel!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    var conversionType = ConversionType.KG
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status and drop into background
        view.endEditing(true)
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
            view.addGestureRecognizer(tap)  // Allows dismissal of keyboard on tap anywhere on screen besides the keyboard itself
        
        
        inputTextField.delegate = self
        
        }
    
    
    @IBAction func SegmentControl(_ sender:UISegmentedControl) {
        
        inputTextField.text = ""
        
        switch segmentControl.selectedSegmentIndex {
        case 0:
            conversionType = .KG; conversionLabel.text = "0.0 Pound"
        case 1:
            conversionType = .Pound ; conversionLabel.text = "0.0 KG"
            
        default:
            conversionType = .KG ; conversionLabel.text = "0.0 pound"
        }
        
    }
    
    
    
    func convertToKG( pound : Double) -> Double {
        
        return pound*2.2
    }
    
    func convertToPound( kg : Double) -> Double {
        
        return kg*0.45
        
        
    }
    
    
    
    var segmentdControlView:UISegmentedControl!
   
    @IBAction func editingChanged(_ sender: Any) {
        
        let amountChang = Double(inputTextField.text ?? "0.0") ?? 0.0
        
        switch conversionType {
        case .KG:
            let convertedValue = convertToKG(pound: amountChang)
            conversionLabel.text = "\(convertedValue) Pound"
            
        case .Pound:
            let convertedValue = convertToPound(kg: amountChang)
            conversionLabel.text = "\(convertedValue) KG"
        }
        
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String)-> Bool {
        
        if (inputTextField.text?.count ?? 0) <= 6 {
            
            return true
        } else {
            
            return false
        }
        
    }
    
}


