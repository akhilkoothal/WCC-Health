//
//  RegistrationVC.swift
//  WCC-Health
//
//  Created by Akhil on 10/4/17.
//
//

import UIKit
import Alamofire

class RegistrationVC: UIViewController {
    
    let URLString = "http://parkapps.kent.edu/WCC-Health/ios/registration_check.php"
    
    @IBOutlet weak var FullNameTextField: UITextField!
    
    @IBOutlet weak var UserNameTextField: UITextField!
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "Registration"
        //UINavigationBar.title = ""
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func RegistrationButtonTapped(_ sender: Any)
    {
        let parameter:[String:Any] = [
            "username":"\(UserNameTextField.text!)",
            "password": "\(passwordTextField.text!)",
            "fullname": "\(FullNameTextField.text!)",
            "email": "\(EmailTextField.text!)"
        ]
        print(parameter)
        
        Alamofire.request(URLString,method:.post, parameters: parameter, encoding: URLEncoding.default,headers:nil).responseJSON { response in
            print(response)
            if let json = response.result.value as? Dictionary<String, AnyObject>
            {
                if let result = json["result"]
                {
                    if result as! String == "true"
                    {
                        let alert = UIAlertController(title: "Registered!!", message: "Registration Successful", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        self.performSegue(withIdentifier: "RegistrationToMapvc", sender: nil)
                    }
                    else
                    {
                        let alert = UIAlertController(title: "Registration", message: "Registration Unsuccessful", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            }
        }
        
    }
    
    
    
    
}
