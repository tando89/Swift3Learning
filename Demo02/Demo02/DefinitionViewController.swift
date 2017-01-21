//
//  DefinitionViewController.swift
//  Demo02
//
//  Created by Tan Do on 1/19/17.
//  Copyright © 2017 Tan Do. All rights reserved.
//

import UIKit

class DefinitionViewController: UIViewController {
    
    @IBOutlet weak var definationLabel: UILabel!
    @IBOutlet weak var emojiLabel: UILabel!
    var emoji = "No Emoji"
    override func viewDidLoad() {
        super.viewDidLoad()
        emojiLabel.text = emoji
        
        if emoji == "😘" {
        definationLabel.text = "A love face"
        }
        if emoji == "🤡" {
            definationLabel.text = "A scary clown"
        }
        if emoji == "🦁" {
            definationLabel.text = "A lion"
        }
        if emoji == "🦊" {
            definationLabel.text = "A fox"
        }
        if emoji == "🐶" {
            definationLabel.text = "A little puppy"
        }
        if emoji == "🐝" {
            definationLabel.text = "A bee"
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
