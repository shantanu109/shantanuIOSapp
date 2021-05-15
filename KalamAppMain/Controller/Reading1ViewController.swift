//
//  Reading1ViewController.swift
//  KalamAppMain
//
//  Created by shantanu pandey on 21/06/18.
//  Copyright © 2018 shantanu pandey. All rights reserved.
//

import UIKit

class Reading1ViewController: UIViewController , UIWebViewDelegate {
    @IBOutlet weak var myWebView: UIWebView!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.weforum.org/agenda/2016/06/blockchain-explained-simply/")
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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

