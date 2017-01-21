//
//  ViewController.swift
//  demo
//
//  Created by Tan Do on 1/17/17.
//  Copyright © 2017 Tan Do. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myText: UILabel!
    
    @IBOutlet weak var Text01: UITextField!
    
    @IBOutlet weak var Text02: UITextField!
    
    @IBAction func buttonTapped(_ sender: Any) {
        let addition = true
        
        if  addition {
            myText.text = "The answer is \(Double(Text01.text!)! + Double(Text02.text!)!)"
        } else {
            myText.text = "The answer is \(Double(Text01.text!)! - Double(Text02.text!)!)"
        }
    }
    
    
    
    @IBAction func tapped02(_ sender: Any) {
        myText.text = "Buttons are cool"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

