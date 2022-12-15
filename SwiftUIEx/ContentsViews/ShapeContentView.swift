//
//  ShapeContentView.swift
//  SwiftUIEx
//
//  Created by AlexHwang on 2022/12/11.
//

import SwiftUI

struct ShapeContentView: View {
    var body: some View {
        VStack{
            Rectangle()
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 20, lineCap: .square, lineJoin: .round, dashPhase: 70))
                .padding(.all, 30)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue)
            
            Circle()
                .fill(Color.blue)
            
            Capsule() // 원이지만 형태를 늘릴수 있다.
                .fill(Color.blue)
            
            Ellipse() // 타원 형식으로 늘어난다.
                .fill(Color.blue)
        }
        .frame(width: 200) // 스택의 프레임을 잡으면 전부 적용됨
    }
}

struct ShapeContentView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
