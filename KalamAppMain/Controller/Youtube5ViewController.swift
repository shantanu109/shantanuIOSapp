//
//  Youtube5ViewController.swift
//  KalamAppMain
//
//  Created by shantanu pandey on 21/06/18.
//  Copyright © 2018 shantanu pandey. All rights reserved.
//

import UIKit

class Youtube5ViewController: UIViewController , UIWebViewDelegate
{
    @IBOutlet weak var myWebView: UIWebView!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let youtubeURL = "https://www.youtube.com/embed/0U9KDQnIsNk"
        myWebView.loadHTMLString("<iframe width=\"375\" height=\"554\" src=\"\(youtubeURL)\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>", baseURL: nil)
        
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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

