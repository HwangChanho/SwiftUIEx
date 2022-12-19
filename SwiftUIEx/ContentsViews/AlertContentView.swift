//
//  AlertContentView.swift
//  SwiftUIEx
//
//  Created by AlexHwang on 2022/12/18.
//

import SwiftUI

struct AlertContentView: View {
    
    @State private var isShowAlert = false
    @State private var selectText = "..."
    
    var body: some View {
        VStack{
            Spacer()
            Button("show alert") {
                isShowAlert.toggle()
            }
            .alert(isPresented: $isShowAlert) {
                
                let primaryButton = Alert.Button.default(Text("done")) {
                    selectText = "done"
                }
                
                let secondaryButton = Alert.Button.default(Text("cancel")) {
                    selectText = "cancel"
                }
                
                return Alert(title: Text("\(isShowAlert.description)"), primaryButton: primaryButton, secondaryButton: secondaryButton)
            }
            
            Spacer()
            Text("\(isShowAlert.description)")
            Spacer()
            Text("\(selectText.description)")
            Spacer()
        }
    }
    
}

struct AlertContentView_Previews: PreviewProvider {
    static var previews: some View {
        AlertContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
