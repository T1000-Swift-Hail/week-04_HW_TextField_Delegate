# week-04_TextField_Delegate_HW

## You are going to create a Mass Converter, to convert from KG to Pounds and vice versa. 

### Follow these steps :
- Create an XCode projec of type iOS app and interface Storyboard. Give it a Product Name : Mass Converter
- In your story board add the following views :
- Add a Label text : Mass Converter , font : Large Title
- Add a Segmented Control. It has 2 segments . Segment 0 , Title KG. Segment 1, Title Pound.
- Add a Lable  text : 0.0 Pound , font style Bold
- Add a Text Field , placeholder : 0.0 . Text Input Traits : Keyboard Type Number Pad
-  Add the appropriate constraints
-  Connect the 0.0 Pound Label to your ViewController . @IBOutlet weak var conversionLabel: UILabel!
-  Connect the Text Field to your ViewController .  @IBOutlet weak var inputTextField: UITextField!
-  Connect the Segmented Field to your ViewController .  @IBOutlet weak var segmentControl: UISegmentedControl!
-  Create an enum :


       enum ConversionType {
          case KG
          case Pound
         }
         
- Create a var in your ViewController : var conversionType = ConversionType.KG
- Connect an  IBAction for your Segmented Control of type Value Changed . 
- - set the inputTextField text to empty
- - inside the function ,  using a Switch on the segmentControl.selectedSegmentIndex 
- - case 0:  conversionType = .KG , conversionLabel.text = "0.0 Pounds"
- - case 1:  conversionType = .Pound , conversionLabel.text = "0.0 KG"
- - case default: conversionType = .KG , conversionLabel.text = "0.0 Pounds"


- Inside your ViewController , create the following functions to handle the mass conversions :


      func convertToKG( pound : Double) -> Double{
        
        return pound*2.2
      }
    
      func convertToPound( kg : Double) -> Double{
        
        return kg*0.45
      }


- Connect an IBAction for your Text Field of type Editing Changed.
- - Inside the function , create var amountValue = 0.0
- - set amountValue to the value from inputTextField.text . *hint use Double() to convert text to Double
- - Using Switch Conditional on conversionType
- - case .KG:

      let convertedValue = convertToKG(pound: amountValue)
      conversionLabel.text = "\(convertedValue) Pounds"
      
- - case .Pound: 

       let convertedValue = convertToPound(kg: amountValue)
       conversionLabel.text = "\(convertedValue) KG"



#### Now , we want to make sure the user of our Mass Converter cannot fill in a lot of numbers , no more than 6 numbers in the our Text Field. For that follow these steps :
- In Your ViewController Conform to Protocole UITextFieldDelegate
- Implement func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
- Inside the function
- - return true if the text field numbers count is 6 or less.
- - return false  if text field numbers count is more than 6 ( false to make the text field not accept the new text change).
- - *hint make sure to add a condition to  watch for the ability to delete some numbers if you hit the limit.




### Extra
*Not required
- Using Tap Gesture Recognizer , dismiss the keyboard when the user taps on the screen .


### Extra Advanced
*Not Required
- Create another project with Product Name : Mass Converter Programmatic
- Create the above application using programmatic views !


### Your app should look similar to  this :
![alt text](https://github.com/T1000-Swift-Hail/week-04_HW_TextField_Delegate/blob/main/Simulator%20Screen%20Shot%20-%20iPhone%2011%20-%202021-10-26%20at%2010.30.43.png?raw=true)


