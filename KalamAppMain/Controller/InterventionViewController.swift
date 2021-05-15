//
//  InterventionViewController.swift
//  KalamAppMain
//
//  Created by shantanu pandey on 20/07/18.
//  Copyright © 2018 shantanu pandey. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase




class InterventionViewController: UIViewController
{
    let ref : DatabaseReference? = Database.database().reference()
    let uid = Auth.auth().currentUser?.uid
    
    var databaseHandle : DatabaseHandle?
    
   
    @IBOutlet weak var firstLabel: UILabel!
    
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var thirdLabel: UILabel!
    
    @IBOutlet weak var fourthLabel: UILabel!
    
    @IBOutlet weak var LabelOne: UILabel!
    
    @IBOutlet weak var LabelTwo: UILabel!
    
    @IBOutlet weak var LabelThree: UILabel!
    
    @IBOutlet weak var LabelFour: UILabel!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        databaseHandle = ref?.child("users").child(uid!).observe(.value, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject]
            {
                self.firstLabel.text = dictionary["IginitingApproval"] as? String
                self.secondLabel.text = dictionary["LahudaanApproval"] as? String
                self.thirdLabel.text = dictionary["RightToWaterApproval"] as? String
                self.fourthLabel.text = dictionary["WhatCanIGiveApproval"] as? String
               
            }
            
        })
       
    }

    override func viewDidAppear(_ animated: Bool)
    {
                self.LabelOne.text = "\(IgnitingViewController.IgnitingTime)"
                self.LabelTwo.text = "\(LahudaanViewController.LahudaanTime)"
                self.LabelThree.text = "\(RightToWaterViewController.RightWaterTime)"
                self.LabelFour.text = "\(WhatCanIGiveViewController.WhatGiveTime)"
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

    

}
