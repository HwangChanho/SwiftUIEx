//
//  WebViewController.swift
//  SwiftUIEx
//
//  Created by MDsqr on 2022/12/19.
//

import Foundation
import UIKit
import WebKit

final class WebViewController: UIViewController, WKNavigationDelegate, WKScriptMessageHandler {
    
    @IBOutlet weak var webView: WKWebView!
    
    var url = "https://google.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView.navigationDelegate = self
        self.webView.load(URLRequest(url: URL(string: url)!))
        
        let contentController = WKUserContentController() // WKScriptMessageHandler
        contentController.add(self, name: "iPhoneInfo")
        
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        
        webView = WKWebView(frame: self.view.bounds, configuration: config)
    }
    
    // WKScriptMessageHandler
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "iPhoneInfo" {
            print("call Native")
        }
    }
    
    // WKNavigationDelegate
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // get WebView title
        self.webView.evaluateJavaScript("document.title") { (result, error) in
            self.navigationItem.title = result as? String
        }
    }
    
}
