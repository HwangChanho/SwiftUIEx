//
//  TextEditerContentView.swift
//  SwiftUIEx
//
//  Created by AlexHwang on 2022/12/19.
//

import SwiftUI

// TextEditer

struct TextEditerContentView: View {
    
    @State private var inputText = ""
    
    var body: some View {
        VStack {
            TextEditor(text: $inputText)
                .padding()
                .textInputAutocapitalization(.never)
                .lineSpacing(5)
                .font(.title)
                .disableAutocorrection(true)
                .onChange(of: inputText) { newValue in // 값을 계속 확인해서 가공 가능
                    if newValue.count > 100 {
                        inputText.removeLast()
                    }
                }
            
            Text("\(inputText.count)" + " / 100")
        }
        
    }
}

struct TextEditerContentView_Previews: PreviewProvider {
    static var previews: some View {
        TextEditerContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
