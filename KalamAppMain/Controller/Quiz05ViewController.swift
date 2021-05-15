//
//  Quiz05ViewController.swift
//  KalamAppMain
//
//  Created by shantanu pandey on 21/06/18.
//  Copyright © 2018 shantanu pandey. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class Quiz05ViewController: UIViewController
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
    
    
    let allQuestions = QuestionBank4()
    var questionNumber: Int = 0
    var score: Int = 0
    var selectedAnswer: Int = 0
    
     static var time = Double()
    static var check5 : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        databaseHandle = ref?.child("users").child(uid!).observe(.value, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject]
            {
                KalamQuiz1ViewController.time = (dictionary["Time Completed"] as? Double)!
            }
            
        })
        
        
        
        
        
        
        
        
        
        
        
        if Quiz05ViewController.check5 == 1
        {
            let alert = UIAlertController(title: "Alert",message:"You have already taken this quiz. Go back and take different quiz.",preferredStyle: .alert)
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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    @IBAction func answerPressed(_ sender: UIButton)
    {
        if sender.tag == selectedAnswer
        {
            print("correct")
            score += 1
            
        }
        else{
            print("Wrong")
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
            selectedAnswer = allQuestions.list[questionNumber].correctAnswer
            
            updateUI()
        }
            
        else
        {
            questionCounter.text = " "
            let alert = UIAlertController(title: "Awesome",message:"End of Quiz. Your score is \(score)",preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "End" , style: .default, handler: {
                action in self.restartQuiz()
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
            scoreLabel.text = "Score: \(score)"
            questionCounter.text = "\(questionNumber + 1)/\(allQuestions.list.count)"
        }
        else
        {
            scoreLabel.text = "Score: \(score)"
            questionCounter.text = " "
        }
    }
    func restartQuiz()
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
    func times()
    {
        
        if KalamQuiz1ViewController.time ==  0
        {
            if score > 4
            {
                
                KalamQuiz1ViewController.time = 1.25
                Quiz05ViewController.check5 = 1
                
            }
            else
            {
                
                KalamQuiz1ViewController.time = 0
                
            }
        }
        else if KalamQuiz1ViewController.time == 2.5
        {
            if score > 4
            {
                
                KalamQuiz1ViewController.time = 3.75
                Quiz05ViewController.check5 = 1
                
            }
            else
            {
                
                KalamQuiz1ViewController.time = 2.5
                
            }
        }
        else if KalamQuiz1ViewController.time == 1.5
        {
            if score > 4
            {
                
                KalamQuiz1ViewController.time = 2.75
                Quiz05ViewController.check5 = 1
                
            }
            else
            {
                
                KalamQuiz1ViewController.time = 1.5
                
            }
        }
        else if KalamQuiz1ViewController.time == 3
        {
            if score > 4
            {
                
                KalamQuiz1ViewController.time = 4.25
               Quiz05ViewController.check5 = 1
                
            }
            else
            {
                
                KalamQuiz1ViewController.time = 3
                
                
            }
        }
        else if KalamQuiz1ViewController.time == 4.5
        {
            if score > 4
            {
                
                KalamQuiz1ViewController.time = 5.75
                Quiz05ViewController.check5 = 1
                
                
            }
            else
            {
                
                KalamQuiz1ViewController.time = 4.5
                
            }
        }
        else if KalamQuiz1ViewController.time == 7.0
        {
            if score > 4
            {
                
                KalamQuiz1ViewController.time = 8.25
                Quiz05ViewController.check5 = 1
                
            }
            else
            {
                
                KalamQuiz1ViewController.time = 7.0
                
                
            }
        }
        else if KalamQuiz1ViewController.time == 1.25
        {
            if score > 4
            {
                
                KalamQuiz1ViewController.time = 2.5
                Quiz05ViewController.check5 = 1
                
            }
            else
            {
                
                KalamQuiz1ViewController.time = 1.25
                
            }
        }
        else if KalamQuiz1ViewController.time == 8.25
        {
            if score > 4
            {
                
                KalamQuiz1ViewController.time = 9.5
                Quiz05ViewController.check5 = 1
                
            }
            else
            {
                
                KalamQuiz1ViewController.time = 8.25
                
            }
        }
        else if KalamQuiz1ViewController.time == 9.5
        {
            if score > 4
            {
                
                KalamQuiz1ViewController.time = 9.5
               Quiz05ViewController.check5 = 1
               
            }
            else
            {
                
                KalamQuiz1ViewController.time = 9.5
                
            }
        }
        else if KalamQuiz1ViewController.time == 5
        {
            if score > 4
            {
                
                KalamQuiz1ViewController.time = 5
                Quiz05ViewController.check5 = 1
                
            }
            else
            {
                
                KalamQuiz1ViewController.time = 5
            }
        }
        else if KalamQuiz1ViewController.time == 3.75
        {
            if score > 4
            {
                
                KalamQuiz1ViewController.time = 5
                Quiz05ViewController.check5 = 1
                
            }
            else
            {
                
                KalamQuiz1ViewController.time = 3.75
            }
        }
        else if KalamQuiz1ViewController.time == 6.5
        {
            if score > 4
            {
                
                KalamQuiz1ViewController.time = 6.5
                Quiz05ViewController.check5 = 1
                
            }
            else
            {
                
                KalamQuiz1ViewController.time = 6.5
            }
        }
        else if KalamQuiz1ViewController.time == 8
        {
            if score > 4
            {
                
                KalamQuiz1ViewController.time = 8
                Quiz05ViewController.check5 = 1
                
            }
            else
            {
                
                KalamQuiz1ViewController.time = 8
            }
        }
        else if KalamQuiz1ViewController.time == 2.75
        {
            if score > 4
            {
                
                KalamQuiz1ViewController.time = 4
                Quiz05ViewController.check5 = 1
                
            }
            else
            {
                
                KalamQuiz1ViewController.time = 2.75
            }
        }
        else if KalamQuiz1ViewController.time == 5.75
        {
            if score > 4
            {
                
                KalamQuiz1ViewController.time = 7
                Quiz05ViewController.check5 = 1
                
            }
            else
            {
                
                KalamQuiz1ViewController.time = 5.75
            }
        }
        else if KalamQuiz1ViewController.time == 4
        {
            if score > 4
            {
                
                KalamQuiz1ViewController.time = 5.25
                Quiz05ViewController.check5 = 1
                
            }
            else
            {
                
                KalamQuiz1ViewController.time = 4
            }
        }
        else if KalamQuiz1ViewController.time == 5.25
        {
            if score > 4
            {
                
                KalamQuiz1ViewController.time = 6.5
                Quiz05ViewController.check5 = 1
                
            }
            else
            {
                
                KalamQuiz1ViewController.time = 5.25
            }
        }

        print("Your time now is \(KalamQuiz1ViewController.time)")
        
        
        
        
    }
    
    override func viewDidDisappear(_ animated: Bool)
    {
        if KalamQuiz1ViewController.time == 0
        {
            KalamQuiz1ViewController.time = 0
        }
        else if KalamQuiz1ViewController.time == 1.5
        {
            KalamQuiz1ViewController.time = 1.5
        }
        else if KalamQuiz1ViewController.time == 3
        {
            KalamQuiz1ViewController.time = 3
        }
        else if KalamQuiz1ViewController.time == 4.5
        {
            KalamQuiz1ViewController.time = 4.5
        }
        else if KalamQuiz1ViewController.time == 2.5
        {
            KalamQuiz1ViewController.time = 2.5
        }
        else if KalamQuiz1ViewController.time == 7.0
        {
            KalamQuiz1ViewController.time = 7.0
        }
        else if KalamQuiz1ViewController.time == 5.5
        {
            KalamQuiz1ViewController.time = 5.5
        }
        else if KalamQuiz1ViewController.time == 9.5
        {
            KalamQuiz1ViewController.time = 9.5
        }
        else if KalamQuiz1ViewController.time == 1.25
        {
            KalamQuiz1ViewController.time = 1.25
        }
        else if KalamQuiz1ViewController.time == 8.25
        {
            KalamQuiz1ViewController.time = 8.25
        }
        else if KalamQuiz1ViewController.time == 5.75
        {
            KalamQuiz1ViewController.time = 5.75
        }
        else if KalamQuiz1ViewController.time == 4.25
        {
            KalamQuiz1ViewController.time = 4.25
        }
        else if KalamQuiz1ViewController.time == 2.75
        {
            KalamQuiz1ViewController.time = 2.75
        }
        else if KalamQuiz1ViewController.time == 3.75
        {
            KalamQuiz1ViewController.time = 3.75
        }
        else if KalamQuiz1ViewController.time == 5
        {
            KalamQuiz1ViewController.time = 5
        }
        else if KalamQuiz1ViewController.time == 6.5
        {
            KalamQuiz1ViewController.time = 6.5
        }
        else if KalamQuiz1ViewController.time == 8.0
        {
            KalamQuiz1ViewController.time = 8.0
        }
        else if KalamQuiz1ViewController.time == 4
        {
            KalamQuiz1ViewController.time = 4
        }
        print("YOUR NEW TIme is \(KalamQuiz1ViewController.time)")
        updateDatabase()
    }
    func updateDatabase()
    {
        
        ref?.child("users").child(uid!).updateChildValues(["Time Completed" : KalamQuiz1ViewController.time])
        ref?.child("users").child(uid!).updateChildValues(["SectionTen" : Quiz05ViewController.check5])
        
        print("Your time has been updated")
        
    }
}


    
    
