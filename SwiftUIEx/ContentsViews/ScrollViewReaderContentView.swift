//
//  ScrollViewReaderContentView.swift
//  SwiftUIEx
//
//  Created by AlexHwang on 2022/12/19.
//

import SwiftUI

// ScrollViewReader 
// 외 않됨?

struct ScrollViewReaderContentView: View {
    
    @State private var proxy: ScrollViewProxy?
    
    var body: some View {
        VStack{
            Button("Scroll To") {
                withAnimation(.easeInOut) {
                    proxy?.scrollTo(40, anchor: .top)
                }
            }
            
            ScrollView {
                ScrollViewReader { proxy in
                    ForEach(0..<50) { index in
                        Text("\(index)")
                            .padding()
                    }
                    .onAppear { // 1회 호출
                        self.proxy = proxy
                        print(proxy)
                    }
                }
            }
        }
    }
}

struct ScrollViewReaderContentView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReaderContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
