//
//  WebView.swift
//  SwiftUIEx
//
//  Created by MDsqr on 2022/12/19.
//

import Foundation
import WebKit
import SwiftUI

// UIView
struct WebView: UIViewRepresentable {
    
    var url: String
    
    func makeUIView(context: Context) -> some UIView {
        let url = URL(string: url)!
        let request = URLRequest(url: url)
        
        let wkWebView = WKWebView()
        wkWebView.load(request)
        
        return wkWebView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

// UIViewController
struct MyWebView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let webVC = UIStoryboard(name: "WebViewController", bundle: nil).instantiateViewController(identifier: "WebViewController") as! WebViewController
        let nav = UINavigationController(rootViewController: webVC)
        
        return nav
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

// UIViewControllerBridge
struct MyWebBridgeView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let nav = UINavigationController(rootViewController: WebViewBridgeController())
        
        return nav
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
