//
//  HomeTester2ViewController.swift
//  KalamAppMain
//
//  Created by shantanu pandey on 23/07/18.
//  Copyright © 2018 shantanu pandey. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class HomeTester2ViewController: UIViewController
{
    
    let ref : DatabaseReference? = Database.database().reference()
    let uid = Auth.auth().currentUser?.uid
    
    var databaseHandle : DatabaseHandle?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.databaseHandle = ref?.child("users").child(uid!).observe(.value, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject]
            {
                
                
                SurveyViewController.checksection14 = (dictionary["SurveySection"] as? Int)!
                print("Checked This Page")
                
            }
            
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

}
