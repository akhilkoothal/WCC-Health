//
//  RecordCoordinatesVC.swift
//  WCC-Health
//
//  Created by Akhil on 10/6/17.
//  Copyright © 2017 Akhil. All rights reserved.
//

import UIKit
import CoreLocation

class RecordCoordinatesVC: UIViewController,UIImagePickerControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "Map"
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SUbmitButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Response Recorded!!", message: "Thank You", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

//    @IBAction func ImageButtonTapped(_ sender: Any) {
//        
//        var myPickerController = UIImagePickerController()
//        myPickerController.delegate = selfteam
//        myPickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
//        self.present(myPickerController,animated: true,completion: nil)
//        
//    }
//    
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        myImageView.image =
//    }
//    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
