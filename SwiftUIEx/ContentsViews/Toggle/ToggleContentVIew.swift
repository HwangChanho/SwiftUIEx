//
//  ToggleContentVIew.swift
//  SwiftUIEx
//
//  Created by MDsqr on 2022/12/15.
//

import SwiftUI

// Toggle (Switch)

struct ToggleContentView: View {
    
    @State private var isOn = false
    
    var body: some View {
        VStack{
            Toggle("toggle \(isOn.description)", isOn: $isOn) // $ binding Type?
                .padding()
            
            MyToggle(isOn: $isOn)
        }
    }
}

struct MyToggle: View {
    
    @Binding var isOn: Bool // @Binding은 값을 가질수 없다, 타입 지정만 가능
    
    var body: some View {
        Toggle("toggle \(isOn.description)", isOn: $isOn) // $ binding Type?
            .padding()
        Toggle(isOn: $isOn, label: {
            HStack{
                Spacer()
                VStack{
                    Text("label")
                    Text("label")
                }
            }
        }) // $ binding Type?
            .padding()
    }
}

struct ToggleContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

