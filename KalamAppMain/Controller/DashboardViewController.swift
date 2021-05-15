//
//  DashboardViewController.swift
//  KalamAppMain
//
//  Created by shantanu pandey on 18/07/18.
//  Copyright © 2018 shantanu pandey. All rights reserved.
//

import UIKit


class DashboardViewController: UIViewController
{

    
    @IBOutlet weak var oneImage: UIImage!
    
    
    @IBOutlet weak var twoImage: UIImageView!
    
    
    @IBOutlet weak var threeImage: UIImageView!
    
    
    @IBOutlet weak var fourImage: UIImageView!
    
    @IBOutlet weak var fiveImage: UIImageView!
    
    
    @IBOutlet weak var sixImage: UIImageView!
    
    
    @IBOutlet weak var sevenImage: UIImageView!
    
    @IBOutlet weak var eightImage: UIImageView!
    
    
    @IBOutlet weak var nineImage: UIImage!
    
    
    
    @IBAction func secondFbButtonTapped(_ sender: Any)
    {
   
        
        if (KalamQuiz1ViewController.time >= 0) && (KalamQuiz1ViewController.time <= 3)
        {
        let activityController = UIActivityViewController(activityItems: [#imageLiteral(resourceName: "NY")], applicationActivities: nil)
        
        
        present(activityController,animated: true,completion: nil)
        }
        else if (KalamQuiz1ViewController.time > 3) && (KalamQuiz1ViewController.time <= 4.5)
        {
            let activityController = UIActivityViewController(activityItems: [#imageLiteral(resourceName: "NYV")], applicationActivities: nil)
            
            
            present(activityController,animated: true,completion: nil)
        }
        
        
    }
    
    @IBAction func firstFbButtonTapped(_ sender: Any)
    {
        if (KalamQuiz1ViewController.time >= 0) && (KalamQuiz1ViewController.time <= 3)
        {
            let activityController = UIActivityViewController(activityItems: [#imageLiteral(resourceName: "LA")], applicationActivities: nil)
            
            
            present(activityController,animated: true,completion: nil)
        }
        else if (KalamQuiz1ViewController.time > 3) && (KalamQuiz1ViewController.time <= 4.5)
        {
            let activityController = UIActivityViewController(activityItems: [#imageLiteral(resourceName: "myImage")], applicationActivities: nil)
            
            
            present(activityController,animated: true,completion: nil)
        }
        
        
    }
    
  
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
 
        
        
    }

   
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

}
