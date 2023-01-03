//
//  ProgressContentView.swift
//  SwiftUIEx
//
//  Created by AlexHwang on 2023/01/03.
//

import SwiftUI

// JSONContentsView

struct ProgressContentsView: View {
    
    @State private var progress: CGFloat = 0
    
    var body: some View {
        VStack {
            Slider(value: $progress)
                .padding()
            
            CircularProgressBar(progress: $progress)
            CircularProgressBar(progress: $progress)
        }
    }
}

struct CircularProgressBar: View {
    
    @Binding var progress: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(.gray, lineWidth: 20)
                .padding()
            
            Circle()
                .trim(from: 0, to: progress)
//                    .stroke(.red, lineWidth: 20)
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .fill(progress == 1 ? .green : .red)
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut)
                .padding()
            
            Text("\(Int(progress * 100))" + "%")
                .foregroundColor(progress == 1 ? .green : .red)
                .animation(.easeInOut)
                .font(.largeTitle)
        }
    }
}

struct ProgressContentsView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressContentsView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
