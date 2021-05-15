//
//  SurveyViewController.swift
//  KalamAppMain
//
//  Created by shantanu pandey on 22/07/18.
//  Copyright © 2018 shantanu pandey. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import Firebase

class SurveyViewController: UIViewController
{
    let ref : DatabaseReference? = Database.database().reference()
    let uid = Auth.auth().currentUser?.uid
    
    var databaseHandle : DatabaseHandle?
    
    @IBOutlet weak var questionCounter: UILabel!
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    
    
    @IBOutlet weak var optionA: UIButton!
    
    @IBOutlet weak var optionB: UIButton!
    
    
    @IBOutlet weak var optionC: UIButton!
    
    @IBOutlet weak var optionD: UIButton!
    
    static var Ans1 = Int()
    static var Ans2 = Int()
    static var Ans3 = Int()
    static var Ans4 = Int()
    static var Ans5 = Int()
    static var Ans6 = Int()
    static var Ans7 = Int()
    static var Ans8 = Int()
    static var Ans9 = Int()
    static var Ans10 = Int()
    
    static var row1 : Int = 0
    
    static var SurveyTime : Double = 0.5
    
    static var FinalAnswer = String()
    
    
   static var Surveylist : Array<Any> = [Ans1,Ans2,Ans3,Ans4,Ans5,Ans6,Ans7,Ans8,Ans9,Ans10]
    
    let allQuestions = QuestionBank10()
    var questionNumber: Int = 0
    var score: Int = 0
    var selectedAnswer: Int = 0
    static var time = Double()
    
    static var checksection14 = Int()
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        databaseHandle = ref?.child("users").child(uid!).observe(.value, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject]
            {
                
                SurveyViewController.checksection14 = (dictionary["SurveySection"] as? Int)!
                
                
            }
            
        })
       
        
        if SurveyViewController.checksection14 == 1
        {
            let alert = UIAlertController(title: "Alert",message:"You have already taken the Survey.",preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Back" , style: .default, handler: {
                action in self
            })
            alert.addAction(restartAction)
            present(alert, animated:  true , completion: nil )
                    }
        else
        {
            
            updateQuestion()
            updateUI()
            
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
       
    }
    
    @IBAction func answerPressed(_ sender: UIButton)
    {
        if sender.tag == 1
        {
            print("correct")
            score += 1
            SurveyViewController.Surveylist[SurveyViewController.row1] = sender.tag
            print(SurveyViewController.Surveylist[SurveyViewController.row1])
            SurveyViewController.row1 += 1
        }
        else if sender.tag == 2
        {
            SurveyViewController.Surveylist[SurveyViewController.row1] = sender.tag
            print(SurveyViewController.Surveylist[SurveyViewController.row1])
            SurveyViewController.row1 += 1
        }
        else if sender.tag == 3
        {
            SurveyViewController.Surveylist[SurveyViewController.row1] = sender.tag
            print(SurveyViewController.Surveylist[SurveyViewController.row1])
            SurveyViewController.row1 += 1
        }
        else if sender.tag == 4
        {
            SurveyViewController.Surveylist[SurveyViewController.row1] = sender.tag
            print(SurveyViewController.Surveylist[SurveyViewController.row1])
            SurveyViewController.row1 += 1
        }
        questionNumber += 1
        updateQuestion()
    }
    func updateQuestion()
    {
        if questionNumber < allQuestions.list.count
        {
            questionLabel.text = allQuestions.list[questionNumber].question
            optionA.setTitle(allQuestions.list[questionNumber].optionA, for: UIControlState.normal)
            optionB.setTitle(allQuestions.list[questionNumber].optionB, for: UIControlState.normal)
            optionC.setTitle(allQuestions.list[questionNumber].optionC, for: UIControlState.normal)
            optionD.setTitle(allQuestions.list[questionNumber].optionD, for: UIControlState.normal)
            
            
            updateUI()
        }
            
        else
        {
             KalamQuiz1ViewController.time = KalamQuiz1ViewController.time + 0.5
            questionCounter.text = " "
            let alert = UIAlertController(title: "Awesome",message:"You have completed the Survey.",preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "End" , style: .default, handler: {
                action in self
            })
            alert.addAction(restartAction)
            present(alert, animated:  true , completion: nil )
        }
        updateUI()
    }
    func updateUI()
    {
        if (questionNumber+1) <= allQuestions.list.count
        {
            
            questionCounter.text = "\(questionNumber + 1)/\(allQuestions.list.count)"
        }
        else
        {
            
            questionCounter.text = " "
        }
    }
    
   
    
   /* func restartQuiz()
    {
        if score > 4
        {
            
            let alert = UIAlertController(title: "Return",message:"Time has been updated to your profile. Go back and take different quiz.",preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "END" , style: .default, handler: {
                action in self
            })
            alert.addAction(restartAction)
            present(alert, animated:  true , completion: nil )
            
        }
        else
        {
            let alert = UIAlertController(title: "NOT GOOD",message:"You need to retake the Quiz",preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart" , style: .default, handler: {
                action in self.retakeQuiz()
            })
            alert.addAction(restartAction)
            present(alert, animated:  true , completion: nil )
        }
        times()
        
    }
 
    func retakeQuiz()
    {
        score = 0
        questionNumber = 0
        updateQuestion()
    }
    */
    
    
    override func viewDidDisappear(_ animated: Bool)
    {
        print(SurveyViewController.Surveylist)
        
        
        print(KalamQuiz1ViewController.time)
        
        
        
       if SurveyViewController.checksection14 == 0
       {
        updateDatabase()
        }
       else if SurveyViewController.checksection14 == 1
       {
        print("This has already been executed")
        }
    }
    func updateDatabase()
    {
        SurveyViewController.checksection14 = 1
        
        ref?.child("users").child(uid!).updateChildValues(["Time Completed" : KalamQuiz1ViewController.time])
        
        ref?.child("users").child(uid!).updateChildValues(["SurveyAnswers" : SurveyViewController.Surveylist])
        ref?.child("users").child(uid!).updateChildValues(["SurveySection" : SurveyViewController.checksection14])
        
     
       
        
    }
    

}
