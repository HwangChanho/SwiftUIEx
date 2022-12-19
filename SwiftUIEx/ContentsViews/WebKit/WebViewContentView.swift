//
//  WebViewContentView.swift
//  SwiftUIEx
//
//  Created by MDsqr on 2022/12/19.
//

import SwiftUI

// WebView
// UIkit

struct WebViewContentView: View {
    
    var body: some View {
        VStack{
//            WebView(url: "http://google.com")
//                .padding(.bottom, 0
            MyWebBridgeView()
        }
    }
}

struct WebViewContentView_Previews: PreviewProvider {
    static var previews: some View {
        WebViewContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
