//
//  PlaceholderContentView.swift
//  SwiftUIEx
//
//  Created by MDsqr on 2022/12/19.
//

import SwiftUI

// Placeholder

struct PlaceHolderContentView: View {
    
    @State private var myString = "hello world"
    @State private var showPlaceholder = false
    
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
//                    .overlay(Circle().stroke())
                
                Text(myString)
                    .foregroundColor(.red)
                    .padding()
            }
            .redacted(reason: showPlaceholder ? .placeholder : .init())
            
            Button("click me") {
                showPlaceholder.toggle()
            }
            .redacted(reason: showPlaceholder ? .placeholder : .init())
        }
    }
}

struct PlaceHolderContentView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceHolderContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
