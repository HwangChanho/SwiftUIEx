//
//  TabViewContentVIew.swift
//  SwiftUIEx
//
//  Created by MDsqr on 2022/12/19.
//

import SwiftUI

//TabView

struct TabViewContentView: View {
    
    var body: some View {
        
        TabView {
            First()
                .tabItem {
                    Image(systemName: "person")
                    Text("person")
                }
                .edgesIgnoringSafeArea(.top)
            
            Second()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("person.fill")
                }
        }
        
    }
    
}

struct First: View {
    var body: some View {
        ZStack {
            Color.orange
            Text("first")
        }
    }
}

struct Second: View {
    var body: some View {
        ZStack {
            Color.yellow
            Text("second")
        }
    }
}

struct TabViewContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabViewContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
