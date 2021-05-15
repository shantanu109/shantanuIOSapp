//
//  Reading66ViewController.swift
//  KalamAppMain
//
//  Created by shantanu pandey on 21/06/18.
//  Copyright © 2018 shantanu pandey. All rights reserved.
//

import UIKit

class Reading66ViewController: UIViewController , UIWebViewDelegate {
    @IBOutlet weak var PDFView: UIWebView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        PDFView.delegate = self
        
        
        
        let path = URL(fileURLWithPath: Bundle.main.path(forResource: "Case Study_ Water ATMs in Rajasthan", ofType: "pdf")!)
        let request = URLRequest(url: path)
        PDFView.loadRequest(request)
        
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    
    
}

