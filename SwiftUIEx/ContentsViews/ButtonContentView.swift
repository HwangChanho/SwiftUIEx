//
//  ButtonContentView.swift
//  SwiftUIEx
//
//  Created by MDsqr on 2022/12/15.
//

import SwiftUI

// Button
// State (Property wrapper)
// 하나의 뷰 안에서 사용되는 값

struct ButtonContentView: View {
    
    @State private var didselectd = false
    
    var buttontImage: String {
        if didselectd {
            return "circle"
        } else {
            return "pencil"
        }
    }
    
    var body: some View {
        VStack {
            Text("current Status : \(didselectd.description)")
            
            Button {
                // action
                didselectd.toggle()
            } label: { // button shape
                HStack {
                    Image(systemName: buttontImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    VStack {
                        Text("fuck")
                        Text("fuck")
                    }
                }
            }
            .frame(width: 200, height: 100)
        }
    }
}

struct ButtonContentView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
