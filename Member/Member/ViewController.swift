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
        self.hideKeyboardWhenTappedAround()
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
        if (teamName == "" || memberCount == "") {
            
            //self.labelMessage.text = "Please insert data"
            let alert = UIAlertController(title: "Warning!", message: "Please insert data", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
        let postParameters = "name="+teamName!+"&member="+memberCount!;
        
        //adding the parameters to request body
        request.httpBody = postParameters.data(using: String.Encoding.utf8)
        
        //creating a task to send the post request
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            (data, response, error) in
            
            if error != nil{
                DispatchQueue.main.async
                {
                        let alert = UIAlertController(title: "Upload Didn't Work?", message: "Looks like the connection to the server didn't work.  Do you have Internet access?", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                }
                print("error is \(String(describing: error))")
                //self.labelMessage.text = "Error"
                return;
            } //End if
            print("response = \(String(describing: response))")
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
//            print("responseString = \(String(describing: responseString))")
//            var msg : String!
//            msg = "responseString = \(String(describing: responseString))"
//            print (msg)
            print (responseString as Any)
            DispatchQueue.main.async
                {
                    let alert = UIAlertController(title: "Congratulation", message: responseString! as String, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
            }
            }// End task
        
            //executing the task
            task.resume()
            //clear the textview
            textName.text = ""
            textMember.text = ""
        }
    }
    
}//end btn
//Hide the keyboard
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
