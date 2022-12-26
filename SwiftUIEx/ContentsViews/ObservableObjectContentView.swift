//
//  ObservableObjectContentView.swift
//  SwiftUIEx
//
//  Created by MDsqr on 2022/12/26.
//

import SwiftUI

// ObservableObject

class MyInfo: ObservableObject {
    @Published var myAge = 20 // 관측하고 싶은 값일떄 @Published
    var myName = "lin" {
        didSet{
            if oldValue.count == 0 { // 타당한 조건을 넣어서 갱신시키고 싶을떄 didset
                objectWillChange.send()
            }
        }
    }
}

struct ObservableObjectContentView: View {
    
    @ObservedObject var myInfo = MyInfo()
    
    var body: some View {
        VStack {
            Text(myInfo.myName)
            Button("change name") {
                myInfo.myName = "le"
            }
        }
        
    }
}

struct ObservableObjectContentView_Previews: PreviewProvider {
    static var previews: some View {
        ObservableObjectContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
