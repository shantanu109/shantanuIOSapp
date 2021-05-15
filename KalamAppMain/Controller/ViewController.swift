//
//  ViewController.swift
//  KalamAppMain
//
//  Created by shantanu pandey on 11/07/18.
//  Copyright © 2018 shantanu pandey. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ViewController: UIViewController
{

    
    var databaseHandle : DatabaseHandle?
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    @IBOutlet weak var signInButton: UIButton!
    
    static var emailUsed = String()
    static var passwordUsed = String()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
      
    
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    @IBAction func signInSelectorChanged(_ sender: Any)
    {
        
    }
    
    
    @IBAction func signInButtonTapped(_ sender: Any)
    {
        self.emailTextField.resignFirstResponder()
        self.passwordTextfield.resignFirstResponder()
       
        if(emailTextField.text?.isEmpty)! || (passwordTextfield.text?.isEmpty)!
        {
            self.spinner.stopAnimating()
            
            let alert = UIAlertController(title: "Alert",message:"All fields are required",preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Back" , style: .default, handler: {
                action in self
            })
            alert.addAction(restartAction)
            present(alert, animated:  true , completion: nil )
            return
        }
        
        if let email = emailTextField.text, let pass = passwordTextfield.text
        {
        
        self.spinner.startAnimating()
            Auth.auth().signIn(withEmail: email, password: pass) { (user , error) in
            if let u = user {
              
                guard let uid = user?.user.uid else {
                    
                    return
                }
                let ref = Database.database().reference(fromURL: "https://kalamappmain.firebaseio.com/")
                
                    let usersReference = ref.child("users").child((user?.user.uid)!)
                
                let values = ["email": self.emailTextField.text] as [String : Any]
                usersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
                    if err != nil{
                       
                        print(err)
                        return
                    }
                })
                self.databaseHandle = ref.child("users").child(uid).observe(.value, with: { (snapshot) in
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
                self.spinner.stopAnimating()
                 self.performSegue(withIdentifier: "newScreen1", sender: self)
                
                
                
            }
            else
            {
                 self.spinner.stopAnimating()
                let alert = UIAlertController(title: "Alert",message:"Incorrect email or password",preferredStyle: .alert)
                let restartAction = UIAlertAction(title: "Back" , style: .default, handler: {
                    action in self
                })
                alert.addAction(restartAction)
                self.present(alert, animated:  true , completion: nil )
            }
        }
        }
        
        

    }
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
}
