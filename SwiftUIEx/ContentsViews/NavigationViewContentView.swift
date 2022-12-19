//
//  NavigationViewContentView.swift
//  SwiftUIEx
//
//  Created by MDsqr on 2022/12/19.
//

import SwiftUI

// NavigationView

struct NavigationViewContentView: View {
    
    init() {
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.red]
        let myAppearance = UINavigationBarAppearance()

        myAppearance.titleTextAttributes = [.foregroundColor : UIColor.red,
                                            .font : UIFont.boldSystemFont(ofSize: 20)]

        myAppearance.largeTitleTextAttributes = [
            .foregroundColor : UIColor.blue,
        ]
        
        myAppearance.backgroundColor = .orange

        UINavigationBar.appearance().standardAppearance = myAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = myAppearance
        UINavigationBar.appearance().compactAppearance = myAppearance
        
        UINavigationBar.appearance().tintColor = .black
//        UINavigationBar.appearance().backgroundColor = .orange
    }
    
    var body: some View {
        NavigationView {
            
            List {
                NavigationLink {
                    Text("destination")
                } label: {
                    HStack {
                        Image(systemName: "pencil")
                        Text("Navigate")
                    }
                }

            }
            .navigationBarTitle("Hello", displayMode: .inline)
            
            
            
//            NavigationLink("click me", destination: {
//                Text("detail")
//            })
//            .navigationBarTitle("Hello", displayMode: .inline)
            
        }
    }
}

struct NavigationViewContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
