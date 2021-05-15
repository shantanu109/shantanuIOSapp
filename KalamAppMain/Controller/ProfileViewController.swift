//
//  ProfileViewController.swift
//  KalamAppMain
//
//  Created by shantanu pandey on 27/06/18.
//  Copyright © 2018 shantanu pandey. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
class ProfileViewController: UIViewController
{
   
    

   
    var LabelText = Double()
    var scores = Int()
    var email : String = ViewController.emailUsed
    let ref : DatabaseReference? = Database.database().reference()
    
     let uid = Auth.auth().currentUser?.uid
    
    static var total = Double()
   
    @IBOutlet weak var TimeLabelOne: UILabel!
    
    @IBOutlet weak var TimeLabelTwo: UILabel!
    
    
    
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    
    
    @IBOutlet weak var ageLabel: UILabel!
    
    
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    
    @IBOutlet weak var cityLabel: UILabel!
    
   
    
    @IBOutlet weak var timess: UILabel!
    
   
   
    @IBAction func logoutButtonTapped(_ sender: Any)
    {
        print(Auth.auth().currentUser!)
        do
        {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "signOut", sender: nil)
        } catch {
            print(error)
        }
        
        print(Auth.auth().currentUser)
      
    }
    
   
    
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject]
            {
                self.usernameLabel.text = dictionary["username"] as? String
                self.ageLabel.text = dictionary["DOB"] as? String
                self.cityLabel.text = dictionary["city"] as? String
                self.genderLabel.text = dictionary["gender"] as? String
                self.countryLabel.text = dictionary["contactNumber"] as? String
                
                
               
            }
           
           
        }, withCancel: nil)
       
    
    }
    override func viewDidAppear(_ animated: Bool)
    {
     
        ProfileViewController.total = KalamQuiz1ViewController.time + IgnitingViewController.InterventionTime
        
        self.timess.text = "\(ProfileViewController.total)"
        
        self.TimeLabelOne.text = "\(KalamQuiz1ViewController.time)"
        
 
        if (KalamQuiz1ViewController.time == 0)
        {
            progress1.progress = 0.0
        }
        else if ((KalamQuiz1ViewController.time > 0) && (KalamQuiz1ViewController.time <= 1.0))
        {
            progress1.progress = 0.1
        }
        else if ((KalamQuiz1ViewController.time > 1.0) && (KalamQuiz1ViewController.time <= 2.0))
        {
            progress1.progress = 0.2
        }
        else if ((KalamQuiz1ViewController.time > 2.0) && (KalamQuiz1ViewController.time <= 3.0))
        {
            progress1.progress = 0.3
        }
        else if ((KalamQuiz1ViewController.time > 3.0) && (KalamQuiz1ViewController.time <= 4.0))
        {
            progress1.progress = 0.4
        }
        else if ((KalamQuiz1ViewController.time > 4.0) && (KalamQuiz1ViewController.time <= 5.0))
        {
            progress1.progress = 0.5
        }
        else if ((KalamQuiz1ViewController.time > 5.0) && (KalamQuiz1ViewController.time <= 6.0))
        {
            progress1.progress = 0.6
        }
        else if ((KalamQuiz1ViewController.time > 6.0) && (KalamQuiz1ViewController.time <= 7.0))
        {
            progress1.progress = 0.7
        }
        else if ((KalamQuiz1ViewController.time > 7.0) && (KalamQuiz1ViewController.time <= 8.0))
        {
            progress1.progress = 0.8
        }
        
        else if ((KalamQuiz1ViewController.time > 8.0) && (KalamQuiz1ViewController.time <= 9.0))
        {
            progress1.progress = 0.9
        }
        
        else if ((KalamQuiz1ViewController.time > 9.0) && (KalamQuiz1ViewController.time <= 9.5))
        {
            progress1.progress = 0.95
        }
        
        else if ((KalamQuiz1ViewController.time > 9.5) && (KalamQuiz1ViewController.time <= 10.0))
        {
            progress1.progress = 1.0
        }
       
        
        
        if (IgnitingViewController.InterventionTime == 0)
        {
            progress2.progress = 0.0
        }
        else if ((IgnitingViewController.InterventionTime > 0) && (IgnitingViewController.InterventionTime <= 1.0))
        {
            progress2.progress = 0.1
        }
        else if ((IgnitingViewController.InterventionTime > 1.0) && (IgnitingViewController.InterventionTime <= 2.0))
        {
            progress2.progress = 0.2
        }
        else if ((IgnitingViewController.InterventionTime > 2.0) && (IgnitingViewController.InterventionTime <= 3.0))
        {
            progress2.progress = 0.3
        }
        else if ((IgnitingViewController.InterventionTime > 3.0) && (IgnitingViewController.InterventionTime <= 4.0))
        {
            progress2.progress = 0.4
        }
        else if ((IgnitingViewController.InterventionTime > 4.0) && (IgnitingViewController.InterventionTime <= 5.0))
        {
            progress2.progress = 0.5
        }
        else if ((IgnitingViewController.InterventionTime > 5.0) && (IgnitingViewController.InterventionTime <= 6.0))
        {
            progress2.progress = 0.6
        }
        else if ((IgnitingViewController.InterventionTime > 6.0) && (IgnitingViewController.InterventionTime <= 7.0))
        {
            progress2.progress = 0.7
        }
        else if ((IgnitingViewController.InterventionTime > 7.0) && (IgnitingViewController.InterventionTime <= 8.0))
        {
            progress2.progress = 0.8
        }
            
        else if ((IgnitingViewController.InterventionTime > 8.0) && (IgnitingViewController.InterventionTime <= 9.0))
        {
            progress2.progress = 0.9
        }
            
        else if ((IgnitingViewController.InterventionTime > 9.0) && (IgnitingViewController.InterventionTime <= 9.5))
        {
            progress2.progress = 0.95
        }
            
        else if ((IgnitingViewController.InterventionTime > 9.5) && (IgnitingViewController.InterventionTime <= 10.0))
        {
            progress2.progress = 1.0
        }
        
        

        
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }
   
    
    @IBOutlet weak var progress1: UIProgressView!
    
    
    @IBOutlet weak var progress2: UIProgressView!
    
}
