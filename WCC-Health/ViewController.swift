//
//  ViewController.swift
//  WCC-Health
//
//  Created by Akhil on 10/3/17.
//
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let URLString = "http://parkapps.kent.edu/WCC-Health/ios/login_check.php"
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func SignUpButtonPressed(_ sender: Any)
    {
        let parameter:[String:Any] = [
            "email":"\(emailTextField.text!)",
            "password": "\(passwordTextField.text!)"
            
        ]
        print(parameter)
        
        
        
        Alamofire.request(URLString,method:.post, parameters: parameter, encoding: URLEncoding.default,headers:nil).responseJSON { response in
            print(response)  // original URL request
            print("response data printed")
            if let json = response.result.value as? Dictionary<String, AnyObject>  {
                if let main = json["result"]{
                    if main as! String == "true"{
                        print("hello: \(main)")
                        self.performSegue(withIdentifier: "Mapvc", sender: nil)
                        
                    }
                    else
                    {
                        let alert = UIAlertController(title: "OOPS!", message: "Wrong Credentials", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            }
            //let data = response.result as Any   // result of response serialization
            //            if(data == true)
            //            {
            //            print("true result")
            //            }
            
            //print("JSON: \(json)")
            //            if let main = json["result"]{
            //                print("result data: \(main!)")
            //                if main == "true"
            //                {
            //
            //                }
            //            }
        }
        
    }
    @IBAction func RegistrationButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "RegistrationButtonPressed", sender: nil)
    }
    
    
    
}

