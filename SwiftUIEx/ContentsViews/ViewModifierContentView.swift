//
//  ViewModifierContentView.swift
//  SwiftUIEx
//
//  Created by AlexHwang on 2022/12/18.
//


import SwiftUI

// ViewModifier

struct ViewModifierContentView: View {
    
    var body: some View {
        VStack {
            Text("Main")
                .font(.largeTitle)
                .foregroundColor(.black)
                .bold()
            Text("Sub")
                .font(.title2)
                .foregroundColor(.orange)
                .italic()
            Text("Discription")
                .modifier(MyTextStyle(myColor: .red))
            Text("Discription")
                .customFont(color: .brown)
                .modifier(MyTextStyle(myWeight: .bold))
        }
    }
    
}

struct MyTextStyle: ViewModifier {
    var myWeight = Font.Weight.regular
    var myFont = Font.title2.weight(.bold)
    var myColor = Color.black
    
    func body(content: Content) -> some View {
        content
            .font(myFont.weight(myWeight))
            .foregroundColor(myColor)
            .padding(.bottom, 20)
    }
}

extension Text {
    func customFont(color: Color) -> Text {
        self
            .font(.title2)
            .bold()
            .italic()
            .foregroundColor(color)
    }
}

struct ViewModifierContentView_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

