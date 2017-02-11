//
//  WebviewViewController.swift
//  JsonNews
//
//  Created by Geeksoft llc on 2/6/17.
//  Copyright © 2017 Geeksoft llc. All rights reserved.
//

import UIKit

class WebviewViewController: UIViewController {

    @IBOutlet weak var webview: UIWebView!
    
    var url: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webview.loadRequest(URLRequest(url: URL(string: url!)!))
        
    }

  

}
