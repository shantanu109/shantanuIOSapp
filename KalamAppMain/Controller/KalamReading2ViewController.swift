//
//  KalamReading2ViewController.swift
//  KalamAppMain
//
//  Created by shantanu pandey on 21/06/18.
//  Copyright © 2018 shantanu pandey. All rights reserved.
//

import UIKit

class KalamReading2ViewController: UIViewController , UIWebViewDelegate {

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var PDFView: UIWebView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        PDFView.delegate = self
        
        
        
        let path = URL(fileURLWithPath: Bundle.main.path(forResource: "Reading 2.doc", ofType: "pdf")!)
        let request = URLRequest(url: path)
        PDFView.loadRequest(request)
        
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
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error)
    {
        spinner.stopAnimating()
        print("Something went wrong")
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    
    
}


