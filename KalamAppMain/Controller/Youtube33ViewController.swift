//
//  Youtube33ViewController.swift
//  KalamAppMain
//
//  Created by shantanu pandey on 21/06/18.
//  Copyright © 2018 shantanu pandey. All rights reserved.
//

import UIKit

class Youtube33ViewController: UIViewController , UIWebViewDelegate {

    @IBOutlet weak var myWebView: UIWebView!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        getVideo(videoCode: "1tcqfWki-hw")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func getVideo(videoCode:String)
    {
        let url = URL(string:"https://www.youtube.com/embed/\(videoCode)")
        myWebView.loadRequest(URLRequest(url: url!))
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
}

