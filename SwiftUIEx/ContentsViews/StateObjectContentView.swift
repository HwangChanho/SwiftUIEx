//
//  StateObjectContentView.swift
//  SwiftUIEx
//
//  Created by MDsqr on 2022/12/26.
//

import SwiftUI

// StateObject


/*
 
 ObservedObject는 전부 갱신,
 StateObject는 뷰를 다시 그리면 갱신하지 않는다.
 
 */

class MyInfo3: ObservableObject {
    @Published var myScore = 0
}

struct StateObjectContentView: View {
    
    @ObservedObject var myInfo = MyInfo3()
    
    var body: some View {
        VStack {
            Text("\(myInfo.myScore)")
                .padding()
            
            Button("PlusA") {
                myInfo.myScore += 1
            }
            
            CustomButton() // 받아서 쓰는거면 동일하게 움직임 CustomButton(myInfo2: myInfo)
        }
    }
}

struct CustomButton: View {
    @ObservedObject var myInfo2 = MyInfo3()
    
    var body: some View {
        VStack {
            Text("\(myInfo2.myScore)")
                .padding()
            
            Button("PlusB") {
                myInfo2.myScore += 1
            }
        }
    }
}

struct StateObjectContentView_Previews: PreviewProvider {
    static var previews: some View {
        StateObjectContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
