//
//  ViewController.swift
//  calc
//
//  Created by Данік on 16/02/2023.
//

import UIKit
import Neumorphic
import NeumorphismKit

class ViewController: UIViewController {

    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double  {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Error reading from the displayLabel")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    

    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        
        if let calcMethod = sender.titleLabel?.text {
            switch calcMethod {
            case "+/-":
                displayValue *= -1
            case "AC":
                displayValue =  0
            case "%":
                displayValue /= 100
            default:
                print("Error")
            }
        }
    }


        
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        // read the valur from the label of the number button
        if let numValue = sender.titleLabel?.text {
            // if isFinishedTyping number is true AKA if we've just opened the calculator or we pressed a calcBUtton
            if isFinishedTypingNumber {
                // put the value of the button into
                displayLabel.text = numValue
                isFinishedTypingNumber = false
                // if some number was already pressed
            } else {
                // or the "." button is pressed
                if numValue == "." {
                    // checking if the displayed number is Int or a Double
                    let isInt = floor(displayValue) == Double(displayValue)
                    // if the typed in number is not an int return AKA if the "." was already pressed before
                    if !isInt {
                        return
                    }
                }
                
                // append the number unless it was a second "."
                displayLabel.text = displayLabel.text! + numValue
                
            }
            
        }
    }

    
    

    
}

