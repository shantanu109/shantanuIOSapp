//
//  Reading4ViewController.swift
//  KalamAppMain
//
//  Created by shantanu pandey on 21/06/18.
//  Copyright © 2018 shantanu pandey. All rights reserved.
//

import UIKit

class Reading4ViewController: UIViewController {

    @IBOutlet weak var myWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let url = URL(string: "https://news.nationalgeographic.com/2018/03/stephen-hawking-dies-black-hole-physics-universe-obituary/")
        myWebView.loadRequest(URLRequest(url: url!))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    
}

