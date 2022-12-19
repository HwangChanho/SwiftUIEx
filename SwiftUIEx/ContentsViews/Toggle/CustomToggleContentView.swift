//
//  CustomToggleContentView.swift
//  SwiftUIEx
//
//  Created by MDsqr on 2022/12/19.
//

import SwiftUI

// CustomToggle

struct CustomToggleContentView: View {
    
    @State private var isOn = false
    
    var body: some View {
        Toggle("\(isOn.description)", isOn: $isOn)
            .toggleStyle(CustomToggle())
            .frame(width: 200, height: 50)
    }
}

struct CustomToggle: ToggleStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        // Design
        Rectangle()
            .foregroundColor(configuration.isOn ? .red : .blue)
            .overlay(
                
                GeometryReader(content: { geometry in // 현재 뷰의 정보 값을 가져올 수 있다.
                    ZStack{
                        Circle().foregroundColor(.yellow)
                            .frame(width: geometry.size.height - 3, height: geometry.size.height)
                        Text(configuration.isOn ? "On" : "Off")
                            .foregroundColor(configuration.isOn ? .red : .blue)
                    }
                    .offset(x: configuration.isOn ? geometry.frame(in: .local).minX + 3 : geometry.frame(in: .local).maxX - geometry.size.height)
                        .animation(.easeInOut(duration: 0.25))
                        .shadow(radius: 10)
                })
            )
            .clipShape(Capsule())
            .onTapGesture(count: 1) {
                configuration.isOn.toggle()
            }
        
    }
}

struct CustomToggleContentView_Previews: PreviewProvider {
    static var previews: some View {
        CustomToggleContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
