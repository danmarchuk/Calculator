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
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    

    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        guard let number = Double(displayLabel.text!) else {
            fatalError("Cannot convert display label text to Double")
        }
        
        if let calcMethod = sender.titleLabel?.text {
            switch calcMethod {
            case "+/-":
                displayLabel.text = String(number * -1)
            case "AC":
                displayLabel.text = String(0)
            case "%":
                displayLabel.text = String(number / 100)
                
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
                    // convert an optional Double to a Double
                    guard let currentDisplayValue = Double(displayLabel.text!) else {
                        fatalError("Cannot convert display label text to a Double")
                    }
                    // checking if the displayed number is Int or a Double
                    let isInt = floor(currentDisplayValue) == Double(currentDisplayValue)
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

