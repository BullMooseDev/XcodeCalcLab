import UIKit

class ViewController: UIViewController {
    
    var savedNumber = Int()
    var operatorInputted = Int()
    var previousNumberAndOperator: String?
    
    var buttonTagNumbers = [Int]()
    @IBOutlet var labelForNumbers: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        buttonTagNumbers.append(sender.tag)
        var stringifiedArray: String = ""
        
        if previousNumberAndOperator != nil {
            _ = buttonTagNumbers.map{ stringifiedArray = stringifiedArray + "\($0)"}
            labelForNumbers.text = "\(previousNumberAndOperator!) \(stringifiedArray)"
        } else {
            _ = buttonTagNumbers.map{ stringifiedArray = stringifiedArray + "\($0)"}
            labelForNumbers.text = stringifiedArray
        }
    }
    
    @IBAction func deleteButton(_ sender: Any){
        buttonTagNumbers = buttonTagNumbers.dropLast()
        var stringifiedArray = buttonTagNumbers
            .map { String($0) }
            .joined(separator: "")
        
//        String = ""
//        _ = buttonTagNumbers.map{ stringifiedArray = stringifiedArray + "\($0)"}
        labelForNumbers.text = stringifiedArray
    }
    
    @IBAction func mathOperator(_ sender: UIButton) {
        savedNumber = Int(labelForNumbers.text!)!
        buttonTagNumbers.removeAll()
        print(savedNumber) //grabbing correctly
        print(buttonTagNumbers) // resetting array
        
        operatorInputted = sender.tag
        previousNumberAndOperator = determineOperator()
        
        labelForNumbers.text = "\(previousNumberAndOperator!)"
    }
    
    @IBAction func equalsPressed(_ sender: UIButton) {
        
        guard let components = labelForNumbers.text?.components(separatedBy: " ") else {
            return
        }
        
        var solution: String = ""
        
        if components[1] == "X" {
          let solutionValue = Int(components[0])! * Int(components[2])!
            solution = String(solutionValue)
            } else if components[1] == "+" {
                let solutionValue = Int(components[0])! + Int(components[2])!
                  solution = String(solutionValue)
                  } else if components[1] == "-" {
                      let solutionValue = Int(components[0])! - Int(components[2])!
                solution = String(solutionValue)
            }
        labelForNumbers.text = solution
        buttonTagNumbers = []
        previousNumberAndOperator = nil
        }

    func determineOperator() -> String? {
            if operatorInputted == 10 {
                return "\(savedNumber) X"
            } else if operatorInputted == 11 {
                return "\(savedNumber) -"
            } else if operatorInputted == 12 {
                return "\(savedNumber) +"
            } else { return nil }
        }
    }
    


//to store math operator***


//check tag of sender and see tags corresponding value
//use the following to assign the initial number value - var savedNumber = Int(labelForNumbers.text!)
// find way to reset button tag numbers value and take new number while still displaying old numbers and inuted symbol?
//use enum to set value and name of case?
//finally on equals press do the math

