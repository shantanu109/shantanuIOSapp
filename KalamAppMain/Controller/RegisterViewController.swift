//
//  RegisterViewController.swift
//  KalamAppMain
//
//  Created by shantanu pandey on 11/07/18.
//  Copyright © 2018 shantanu pandey. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class RegisterViewController: UIViewController
{
    var usernameUsed = String()
    var emailUsed = String()
    var contactUsed = String()
    var genderUsed = String()
    var ageUsed = String()
    var cityUsed = String()
    
    static var newEmail = String()
    static var newUsername = String()
    static var newContact = String()
    static var newGender = String()
    static var newAge = String()
    static var newCity = String()
    
    static var PhotoEmail = String()
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    
    @IBOutlet weak var retypePasswordTextField: UITextField!
    
    
    @IBOutlet weak var contactNumberTextField: UITextField!
    
    @IBOutlet weak var cityTextField: UITextField!
    
   
    @IBOutlet weak var latestGenderTextField: UITextField!
    
    
    
    
    @IBOutlet weak var dobTextField: UITextField!
    
    
    
    
   
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    @IBAction func signUpButtonTapped(_ sender: Any)
    {
        let email = emailTextField.text
        let pass = passwordTextField.text 
        
        self.emailTextField.resignFirstResponder()
        self.cityTextField.resignFirstResponder()
        self.contactNumberTextField.resignFirstResponder()
        self.dobTextField.resignFirstResponder()
        self.latestGenderTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        self.retypePasswordTextField.resignFirstResponder()
        
        
        
        
        if(emailTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)!
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
        if ((passwordTextField.text?.elementsEqual(retypePasswordTextField.text!))! != true)
        {
             self.spinner.stopAnimating()
            let alert = UIAlertController(title: "Alert",message:"Passwords donot match",preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Back" , style: .default, handler: {
                action in self
            })
            alert.addAction(restartAction)
            present(alert, animated:  true , completion: nil )
            return
        }
         self.spinner.startAnimating()
        Auth.auth().createUser(withEmail: email!, password: pass!) { (user, error) in
            
            if let u = user
            {
                guard let uid = user?.user.uid else {
                    return
                }
                let ref = Database.database().reference(fromURL: "https://kalamappmain.firebaseio.com/")
                let usersReference = ref.child("users").child((user?.user.uid)!)
                
                let values = ["username": self.usernameTextField.text ,"email": self.emailTextField.text ,"contactNumber": self.contactNumberTextField.text ,"city": self.cityTextField.text ,"gender": self.latestGenderTextField.text, "DOB": self.dobTextField.text, "Time Completed": 0,"IginitingApproval": "🕓","LahudaanApproval": "🕓","RightToWaterApproval": "🕓","WhatCanIGiveApproval": "🕓" ,"SectionOne": 0,"SectionTwo": 0,"SectionThree": 0,"SectionFour": 0,"SectionFive": 0,"SectionSix": 0,"SectionSeven": 0,"SectionEight": 0,"SectionNine": 0,"SectionTen": 0,"SectionEleven": 0,"SectionTwelve": 0,"SectionThirteen": 0,"SurveySection": 0,"IgnitingTime": 0,"LahudaanTime": 0,"RightToWaterTime": 0,"WhatCanIGiveTime": 0,"InterventionTime": 0,"SurveyAnswers": SurveyViewController.Surveylist] as [String : Any]
                
                self.emailUsed = self.emailTextField.text!
                self.ageUsed = self.dobTextField.text!
                self.contactUsed = self.contactNumberTextField.text!
                self.genderUsed = self.latestGenderTextField.text!
                self.usernameUsed = self.usernameTextField.text!
                self.cityUsed = self.cityTextField.text!
                
                usersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
                    if err != nil{
                        print(err)
                       
                    
                        return
                        
                    }
                })
                self.spinner.stopAnimating()
                self.performSegue(withIdentifier: "newScreen2", sender: self)
            }
            else
            {
                self.spinner.stopAnimating()
                let alert = UIAlertController(title: "Alert",message:"Email already exists ",preferredStyle: .alert)
                let restartAction = UIAlertAction(title: "Back" , style: .default, handler: {
                    action in self
                })
                alert.addAction(restartAction)
                self.present(alert, animated:  true , completion: nil )
                return
            }
        }
    }
    override func viewDidDisappear(_ animated: Bool)
    {
        
      RegisterViewController.newUsername = self.usernameUsed
      RegisterViewController.newEmail = self.emailUsed
      RegisterViewController.newAge = self.ageUsed
      RegisterViewController.newGender = self.genderUsed
      RegisterViewController.newContact = self.contactUsed
      RegisterViewController.newCity = self.cityUsed
      RegisterViewController.PhotoEmail = self.emailUsed
        print( RegisterViewController.newUsername)
        print( RegisterViewController.newCity)
        print( RegisterViewController.newContact)
        print( RegisterViewController.newGender)
        print( RegisterViewController.newEmail)
        
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }

}
