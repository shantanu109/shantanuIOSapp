//
//  Youtube1ViewController.swift
//  KalamAppMain
//
//  Created by shantanu pandey on 21/06/18.
//  Copyright © 2018 shantanu pandey. All rights reserved.
//

import UIKit

class Youtube1ViewController: UIViewController , UIWebViewDelegate {
    @IBOutlet weak var myWebView: UIWebView!
    
    
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        getVideo(videoCode: "oSP-taqLWPQ")
       
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool
    {
        spinner.startAnimating()
        return true
        
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView)
    {
        spinner.stopAnimating()
        
        
        
    }
    
    func getVideo(videoCode:String)
    {
     
        let url = URL(string:"https://www.youtube.com/embed/\(videoCode)")
        
        myWebView.loadRequest(URLRequest(url: url!))
    }
    
    
    
    
}
