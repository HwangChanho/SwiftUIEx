//
//  StateContentView.swift
//  SwiftUIEx
//
//  Created by AlexHwang on 2022/12/19.
//

import SwiftUI

// State (Heap 영역에 올라감) 근데 이럴꺼면 class 쓰지 왜 struct..?

struct StateContentView: View {
    
    @State private var myName = "kim"
    
    var body: some View {
        VStack {
            Text(myName)
                .padding()
            
            Button("change name") {
                myName = "lee"
            }
            
            TextField("TF Title", text: $myName)
                .padding()
        }
    }
}

struct StateContentView_Previews: PreviewProvider {
    static var previews: some View {
        StateContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
