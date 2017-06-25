//
//  ViewController.swift
//  CalculatorApp
//
//  Created by tan on 6/24/17.
//  Copyright © 2017 tan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var num1Text: UITextField!
    
    @IBOutlet weak var num2Text: UITextField!
    
    @IBOutlet weak var resultText: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func Addition(_ sender: Any) {
        operateNumbers(operation: "Add");
    }

    @IBAction func Subtraction(_ sender: Any) {
        operateNumbers(operation: "Minus");
    }
    
    @IBAction func Multiplication(_ sender: Any) {
        operateNumbers(operation: "Times");
    }
    
    @IBAction func Division(_ sender: Any) {
        operateNumbers(operation: "Divides");
    }
    //function that will be used for all the buttons
    func operateNumbers(operation: String) {
        //make sure numbers are double not string
        if Double(num1Text.text!) != nil && Double(num2Text.text!) != nil {
            let num1 = Double(num1Text.text!);
            let num2 = Double(num2Text.text!);
            
            var sum = Double();
            
            switch operation{
            case "Add":
                sum = num1! + num2!;
                break;
            case "Minus":
                sum = num1! - num2!;
                break;
            case "Times":
                sum = num1! * num2!;
                break;
            case "Divides":
                sum = num1! / num2!;
                break;
            default:
                break;
            }
            
            resultText.text = String(sum);
            
        } else {
            resultText.text = "Please Enter 2 numbers in both text fields";
        }
    }

}

