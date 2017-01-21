//
//  DefinitionViewController.swift
//  Demo02
//
//  Created by Tan Do on 1/19/17.
//  Copyright © 2017 Tan Do. All rights reserved.
//

import UIKit

class DefinitionViewController: UIViewController {
    
    @IBOutlet weak var BirthYearLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var definationLabel: UILabel!
    @IBOutlet weak var emojiLabel: UILabel!
    var emoji = Emoji()
    override func viewDidLoad() {
        super.viewDidLoad()
        emojiLabel.text = emoji.stringEmoji
        BirthYearLabel.text = "Origination Date: \(emoji.birthYear)"
        categoryLabel.text = "Category: \(emoji.category)"
        definationLabel.text = "Defination: \(emoji.definition)"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
