//
//  ViewController.swift
//  WebBrowserApp
//
//  Created by Dmitry Cherkasov on 7/27/17.
//  Copyright © 2017 Dmitry Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        searchBar.text = "http://"
//        searchBar.delegate = self
//        
        let url = URL(string: "https://google.com")
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func webViewDidStartLoad(_ : UIWebView) {
        activityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ : UIWebView) {
        activityIndicator.stopAnimating()
    }
    
    func searchBarCancelButtonClicked(_ searchbar: UISearchBar) {
        searchbar.resignFirstResponder()
        let text = searchBar.text
        let url = URL(string: text!)
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
    }

    
}

