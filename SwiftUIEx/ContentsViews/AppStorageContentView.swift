//
//  AppStorageContentView.swift
//  SwiftUIEx
//
//  Created by MDsqr on 2022/12/26.
//

import SwiftUI

// AppStorageContentView

struct AppStorageContentView: View {
    
    @AppStorage("keyWord") var mode = false
    @AppStorage("keyWord2") var notiCount = ""
    
    var body: some View {
        ZStack {
            
            mode ? Color.orange.opacity(0.5) : Color.gray
            
            VStack {
                Button("Button") {
                    mode.toggle()
                }
                
                TextField("Noti Count", text: $notiCount)
            }
           
        }
    }
}

struct AppStorageContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
