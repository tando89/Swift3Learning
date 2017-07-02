//
//  ViewController.swift
//  Member
//
//  Created by tan on 7/1/17.
//  Copyright © 2017 tan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let URL_SAVE_TEAM = "https://schoolserver-tand089.c9users.io/addMember.php"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var textName: UITextField!
    
    
    @IBOutlet weak var textMember: UITextField!
    
    @IBOutlet weak var labelMessage: UILabel!
    
    @IBAction func buttonSave(_ sender: Any) {
        let requestURL = NSURL(string: URL_SAVE_TEAM)
        let request = NSMutableURLRequest(url: requestURL! as URL)
        
        request.httpMethod = "POST"
        
        //getting values from text fields
        let teamName=textName.text
        let memberCount = textMember.text
        
        //creating the post parameter by concatenating the keys and values from text field
        let postParameters = "name="+teamName!+"&member="+memberCount!;
        
        //adding the parameters to request body
        request.httpBody = postParameters.data(using: String.Encoding.utf8)
        
        //creating a task to send the post request
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            (data, response, error) in
            
            if error != nil{
                print("error is \(String(describing: error))")
                return;
            } //End if
                //parsing the response
                do {
                    //converting resonse to NSDictionary
                    let myJSON =  try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                    
                    //parsing the json
                    if let parseJSON = myJSON {
                        
                        //creating a string
                        var msg : String!
                        
                        //getting the json response
                        msg = parseJSON["message"] as! String?
                        
                        //printing the response
                        self.labelMessage.text = msg
                        print(msg)
                        
                    } //end if
                } //end do
                catch {
                    print(error)
                }//end catch
         }// End task
            //executing the task
            task.resume()
        }
    }//end btn
