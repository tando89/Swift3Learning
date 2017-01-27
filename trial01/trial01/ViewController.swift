import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        myLabel.text = ""
        
        let url = URL(string: "http://date.jsontest.com")
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil
            {
                print ("ERROR")
            }
            else
            {
                if let content = data
                {
                    do
                    {
                        //Array
                        let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        if let date = myJson["date"] as? String {
                            DispatchQueue.main.async() {
                                self.myLabel.text = date
                            }
                        }
                        if let time = myJson["time"] as? String {
                        print(time)
                        }
                        
                    }
                    catch
                    {
                        
                    }
                }
            }
        }
        task.resume()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func myButton(_ sender: Any) {
        if textField.text == "date" {
            
        }
    }
    
}


