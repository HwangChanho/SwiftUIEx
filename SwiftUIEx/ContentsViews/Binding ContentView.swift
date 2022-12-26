//
//  Binding ContentView.swift
//  SwiftUIEx
//
//  Created by MDsqr on 2022/12/26.
//

import SwiftUI

// Binding

struct BindingContentView: View {
    
    @State private var myBool = false
    
    var body: some View {
        
        NavigationView {
            VStack{
                NavigationLink {
                    DetailView(mainToggleValue: $myBool)
                } label: {
                    Text("Navigate")
                }
                
                Toggle(myBool.description, isOn: $myBool)
            }
        }
    }
}

struct DetailView: View {
    
    // 값을 받아와서 쓰는거기 떄문에 타입만 지정
    @Binding var mainToggleValue: Bool
    
    var body: some View {
        Toggle(mainToggleValue.description, isOn: $mainToggleValue)
    }
}



struct BindingContentView_Previews: PreviewProvider {
    static var previews: some View {
        BindingContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
