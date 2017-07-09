//
//  ViewController.swift
//  Calendar
//
//  Created by Tan Do on 7/8/17.
//  Copyright © 2017 Tan Do. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var date: [String] = []
    var note: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url=URL(string:"https://schoolserver-tand089.c9users.io/Calendar.php")
        do {
            let allContactsData = try Data(contentsOf: url!)
            let allContacts = try JSONSerialization.jsonObject(with: allContactsData, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
            if let arrJSON = allContacts["Calendar"] {
                for index in 0...arrJSON.count-1 {
                    
                    let aObject = arrJSON[index] as! [String : AnyObject]
                    
                    date.append(aObject["Date"] as! String)
                    note.append(aObject["Note"] as! String)
                }
            }
            print(date)
            print(note)
            tableView.dataSource = self
            self.tableView.reloadData()
        }
        catch {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.date.count;
    }
    func tableView(_ tableView: UITableView!, didSelectRowAtIndexPath indexPath: IndexPath!) {
        print("You selected date : "+date[indexPath.row])
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        var cell = tableView.dequeueReusableCell(withIdentifier: "CalendarCells")
//        cell?.textLabel?.numberOfLines = 2
//        cell?.textLabel?.lineBreakMode = .byWordWrapping
//        cell?.detailTextLabel?.numberOfLines = 3;
//        cell?.detailTextLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        if !(cell != nil) {
            //cell = UITableViewCell(style: .subtitle, reuseIdentifier: "CalendarCells")
            cell = tableView.dequeueReusableCell(withIdentifier: "CalendarCells")
        }
        
        cell!.textLabel?.text=self.date[indexPath.row]
        cell!.detailTextLabel?.text = self.note[indexPath.row]
        return cell!
    }
}

