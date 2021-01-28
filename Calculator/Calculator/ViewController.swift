//
//  ViewController.swift
//  Calculator
//
//  Created by Дмитрий Антонов on 27.01.2021.
//

import UIKit

class ViewController: UIViewController
{

    
    @IBOutlet weak var calcExpression: UILabel!
    
    @IBOutlet weak var calcResult: UILabel!
    
    var workings:String = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        clearAll()
    }
    
    func clearAll()
    {
        workings = ""
        calcExpression.text = ""
        calcResult.text = ""
    }
    
    @IBAction func clearBut(_ sender: Any)
    {
        clearAll()
    }
    
    
    @IBAction func backBut(_ sender: Any)
    {
        if (workings.isEmpty)
        {
            workings.removeLast()
            calcExpression.text = workings
        }
    }
    
    func addToWorkings(value: String)
    {
        workings = workings + value
        calcExpression.text = workings
    }
    
    @IBAction func procentBut(_ sender: Any)
    {
        addToWorkings(value: "%")
    }
    
    @IBAction func divisionBut(_ sender: Any)
    {
        addToWorkings(value: "/")
    }
    
    @IBAction func multBut(_ sender: Any)
    {
        addToWorkings(value: "x")
    }
    
    @IBAction func subBut(_ sender: Any)
    {
        addToWorkings(value: "-")
    }
    
    @IBAction func addBut(_ sender: Any)
    {
        addToWorkings(value: "+")
    }
    
    @IBAction func resultBut(_ sender: Any)
    {
        if (validInput())
        {
        let checkedWorkingForProcentBut = workings.replacingOccurrences(of: "%", with: "*0.01")
        let expression = NSExpression(format: checkedWorkingForProcentBut)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
        let resultString = formatResult(result: result)
        calcResult.text = resultString
        } else
        {
            let alert = UIAlertController(title: "incorrect input", message: "Calculator can't do input", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
        
        func specialCharacter(char: Character) -> Bool
        {
            if char == "*"
            {
                return true
            }
            
            if char == "-"
            {
                return true
            }
            
            if char == "+"
            {
                return true
            }
            
            if char == "/"
            {
                return true
            }
            return false
        }
    
    
    func validInput() -> Bool
    {
    var count = 0
    var funcCharIndexes = [Int]()
    
    for char in workings
        {
        if specialCharacter(char: char)
        {
            funcCharIndexes.append(count)
        }
        count += 1
        
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes
        {
            if (index == 0)
            {
                return false
            }
            
            if (index == workings.count - 1)
            {
                return false
            }
            
            if (previous != 1)
            {
                if (index - previous == 1)
                {
                    return false
                }
            }
            previous = index
            
        }
        return true
    }
    
    func formatResult(result: Double) -> String
    {
        if (result.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format: "%.0f", result)
        } else
        {
            return String(format: "%.2f", result)
        }
    }
    
    @IBAction func decBut(_ sender: Any)
    {
    }
    
    @IBAction func zeroBut(_ sender: Any) {
        addToWorkings(value: "0")
    }
    
    @IBAction func oneBut(_ sender: Any) {
        addToWorkings(value: "1")
    }
    
    @IBAction func twoBut(_ sender: Any) {
        addToWorkings(value: "2")
    }
    
    @IBAction func threeBut(_ sender: Any) {
        addToWorkings(value: "3")
    }
    
    @IBAction func fourBut(_ sender: Any) {
        addToWorkings(value: "4")
    }
    
    @IBAction func fiveBut(_ sender: Any) {
        addToWorkings(value: "5")
    }
    
    @IBAction func sixBut(_ sender: Any) {
        addToWorkings(value: "6")
    }
    
    @IBAction func sevenBut(_ sender: Any) {
        addToWorkings(value: "7")
    }
    
    @IBAction func eightBut(_ sender: Any) {
        addToWorkings(value: "8")
    }
    
    @IBAction func nineBut(_ sender: Any) {
        addToWorkings(value: "9")
    }
    
    
    
    
    
    
    
    
}

