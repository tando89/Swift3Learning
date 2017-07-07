//
//  ViewController.swift
//  Member
//  Notice: all the textfields have to be delegate in order to control the keyboard. hold ctrl and drag to viewcontroller > choose delegate
//  Created by tan on 7/1/17.
//  Copyright © 2017 tan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let URL_SAVE_TEAM = "https://schoolserver-tand089.c9users.io/addMember.php"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //dismiss keyboard when touching outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    //dismiss keyboard when hit return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    //UITextField property to hold the most recently used textfield
    private var currentTextField: UITextField?
    //function to stop editting the last used textfield
    func textFieldDidBeginEditing(_ textField: UITextField) {
        currentTextField = textField
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
            //display alert to for empty fields
            let alert = UIAlertController(title: "Warning!", message: "Please insert data", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
        //Declare the parameters
        let postParameters = "name="+teamName!+"&member="+memberCount!;
        
        //adding the parameters to request body
        request.httpBody = postParameters.data(using: String.Encoding.utf8)
        
        //creating a task to send the post request
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            (data, response, error) in
            //error occurs
            if error != nil
            {
                print(error as Any)
                //let ErrorString = NSString(error: error!, encoding: String.Encoding.utf8.rawValue)
                //p/rint(ErrorString)
                DispatchQueue.main.async
               {
                       let alert = UIAlertController(title: "Upload Didn't Work?", message: "error!", preferredStyle: .alert)
                       alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                       self.present(alert, animated: true, completion: nil)
               }
            } //No error
            else
            {
            print("response = \(String(describing: response))")
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print (responseString as Any)
            DispatchQueue.main.async
             {
                    let alert = UIAlertController(title: "Congratulation", message: responseString! as String, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
             }
            }//end else
        }// End task
        
            //executing the task
            task.resume()
            //clear the textview
            textName.text = ""
            textMember.text = ""
            //call the function to stop editting the last textfield
            if let currentTextField = currentTextField {
                currentTextField.resignFirstResponder()
            }
        }
    }
    
}
