//
//  ViewController.swift
//  Demo02
//
//  Created by Tan Do on 1/17/17.
//  Copyright © 2017 Tan Do. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var emojis : [Emoji] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        emojis = makeEmojiArray()
    }
    //number of cells. In this case it depends on the emojis array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return things in the array
        return emojis.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let emoji = emojis[indexPath.row]
        // display things in the array (row)
        cell.textLabel?.text = emoji.stringEmoji
        return cell
    }
    //tap on array to pop up something
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let emoji = emojis[indexPath.row]
        performSegue(withIdentifier: "moveSegue", sender: emoji)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let defVC = segue.destination as! DefinitionViewController
        defVC.emoji = sender as! Emoji
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //function retruns array of emoji
    func makeEmojiArray() -> [Emoji] {
        let emoji1 = Emoji()
        emoji1.stringEmoji = "😘"
        emoji1.birthYear = 2010
        emoji1.category = "Smiley Face"
        emoji1.definition = "A loving face"
        
        let emoji2 = Emoji()
        emoji2.stringEmoji = "🤡"
        emoji2.birthYear = 2016
        emoji2.category = "Smiley Face"
        emoji2.definition = "A Scary Clown"
        
        let emoji3 = Emoji()
        emoji3.stringEmoji = "🦁"
        emoji3.birthYear = 2016
        emoji3.category = "Animals"
        emoji3.definition = "A Cute Lion"
        
        let emoji4 = Emoji()
        emoji4.stringEmoji = "🦊"
        emoji4.birthYear = 2016
        emoji4.category = "Animals"
        emoji4.definition = "A Cute Fox"
        
        let emoji5 = Emoji()
        emoji5.stringEmoji = "🐶"
        emoji5.birthYear = 2010
        emoji5.category = "Animals"
        emoji5.definition = "A Lil Puppy"
        
        let emoji6 = Emoji()
        emoji6.stringEmoji = "🐝"
        emoji6.birthYear = 2011
        emoji6.category = "Animals"
        emoji6.definition = "A Killer Bee"
        
        return [emoji1, emoji2, emoji3, emoji4, emoji5, emoji6]
   
        
    }
}

