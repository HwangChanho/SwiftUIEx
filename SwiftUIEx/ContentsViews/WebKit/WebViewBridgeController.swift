//
//  WebViewBridgeController.swift
//  SwiftUIEx
//
//  Created by MDsqr on 2022/12/19.
//

import Foundation
import UIKit
import WebKit

final class WebViewBridgeController: UIViewController, WKScriptMessageHandler {
    
    var url = "https://google.com"
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let contentController = WKUserContentController() // WKScriptMessageHandler
        contentController.add(self, name: "iPhoneInfo")
        
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        
        webView = WKWebView(frame: self.view.bounds, configuration: config)
        webView.navigationDelegate = self
        webView.uiDelegate = self
        
        self.view.addSubview(webView)
        
        let localfile = Bundle.main.path(forResource: "SomeFile", ofType: "html")!
        let url = URL(fileURLWithPath: localfile)
        let request = URLRequest(url: url)
        
        webView.load(request)
    }
    
    // WKScriptMessageHandler
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "iPhoneInfo" {
            print("call Native")
        }
    }
    
}

extension WebViewBridgeController: WKUIDelegate {
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        let alertController = UIAlertController(title: "js test", message: message, preferredStyle: .alert)
        
        let doneAction = UIAlertAction(title: "확인", style: .default) { _ in
            completionHandler()
        }
        
        alertController.addAction(doneAction)
        
        self.present(alertController, animated: true)
    }
}

extension WebViewBridgeController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.evaluateJavaScript("showAlert('hi')")
    }
}
