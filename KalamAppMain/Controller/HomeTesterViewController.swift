//
//  HomeTesterViewController.swift
//  KalamAppMain
//
//  Created by shantanu pandey on 22/07/18.
//  Copyright © 2018 shantanu pandey. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import Firebase

class HomeTesterViewController: UIViewController
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
                
                KalamQuiz1ViewController.checksection1 =  (dictionary["SectionOne"] as? Int)!
                KalamQuiz2ViewController.checksection2 = (dictionary["SectionTwo"] as? Int)!
                KalamQuiz3ViewController.checksection3 = (dictionary["SectionThree"] as? Int)!
                Quiz1ViewController.check1 = (dictionary["SectionFour"] as? Int)!
                Quiz2ViewController.check2 = (dictionary["SectionFive"] as? Int)!
                Quiz3ViewController.check3 = (dictionary["SectionSix"] as? Int)!
                Quiz33ViewController.check33 = (dictionary["SectionSeven"] as? Int)!
                Quiz4ViewController.check4 = (dictionary["SectionEight"] as? Int)!
                Quiz4MAinViewController.check44 = (dictionary["SectionNine"] as? Int)!
                Quiz05ViewController.check5 = (dictionary["SectionTen"] as? Int)!
                Quiz55ViewController.check55 = (dictionary["SectionEleven"] as? Int)!
                Quiz6ViewController.check6 = (dictionary["SectionTwelve"] as? Int)!
                Quiz6MainViewController.check66 = (dictionary["SectionThirteen"] as? Int)!
                IgnitingViewController.IgnitingTime = (dictionary["IgnitingTime"] as? Double)!
                LahudaanViewController.LahudaanTime = (dictionary["LahudaanTime"] as? Double)!
                RightToWaterViewController.RightWaterTime = (dictionary["RightToWaterTime"] as? Double)!
                WhatCanIGiveViewController.WhatGiveTime = (dictionary["WhatCanIGiveTime"] as? Double)!
                SurveyViewController.checksection14 = (dictionary["SurveySection"] as? Int)!
                IgnitingViewController.InterventionTime = (dictionary["InterventionTime"] as? Double)!
                KalamQuiz1ViewController.time = (dictionary["Time Completed"] as? Double)!
                RegisterViewController.PhotoEmail = (dictionary["email"] as? String)!
                
            }
            
        })

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    


}
