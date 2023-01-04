//
//  CarculatorContentView.swift
//  SwiftUIEx
//
//  Created by MDsqr on 2023/01/04.
//

import SwiftUI

// CarculatorContentView

struct CalcButton: View {
    
    var buttonName = ""
    
    var body: some View {
        Circle()
            .foregroundColor(.orange)
            .overlay {
                Text("\(buttonName)")
                    .font(.largeTitle)
            }
    }
}

struct CarculatorContentView: View {
    
    @State var geoMetryCircleHeight: CGFloat = 50
    
    let data = [
        ["AC", "+-", "%", "/"],
        ["7", "8", "9", "x"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", ".", "="]
    ]
    
    var body: some View {
        VStack {
            Spacer(minLength: 50) // 50 보다 크게
            
            Text("number")
                .font(.largeTitle)
                .padding(.trailing, 10)
                .frame(width: UIScreen.main.bounds.size.width - 20, alignment: .trailing)
            
            ForEach (0..<4) { indexI in
                HStack(spacing: 10) {
                    ForEach (0..<4) { indexJ in
                        CalcButton(buttonName: data[indexI][indexJ])
                            .aspectRatio(1, contentMode: .fit)
                    }
                }.padding(.horizontal, 10)
            }
            
            // last line
            HStack(spacing: 10) {
                GeometryReader { geometry in // object 가 가지고있는 크기를 가져온다.
                    Capsule()
                        .foregroundColor(.orange)
                        .aspectRatio(CGSize(width: geometry.size.height * 2 + 10, height: geometry.size.height), contentMode: .fit)
                        .overlay(content: {
                            Text(data[4][0])
                                .font(.largeTitle)
                        })
                        .onAppear {
                            self.geoMetryCircleHeight = geometry.size.height
                        }
                }
                CalcButton(buttonName: data[4][1])
                    .aspectRatio(1, contentMode: .fit)
                CalcButton(buttonName: data[4][2])
                    .aspectRatio(1, contentMode: .fit)
            }
            .aspectRatio(CGSize(width: geoMetryCircleHeight * 4 + 30, height: geoMetryCircleHeight), contentMode: .fit)
            .padding(.horizontal, 10)
        }.padding(.horizontal, 10)
    }
}

struct CarculatorContentView_Previews: PreviewProvider {
    static var previews: some View {
        CarculatorContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
