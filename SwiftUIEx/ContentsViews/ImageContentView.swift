//
//  ImageContentView.swift
//  SwiftUIEx
//
//  Created by MDsqr on 2022/12/08.
//

import SwiftUI

struct ImageContentView: View {
    var body: some View {
        VStack() {
            Text("Hello")
                .background(Color.red)
            Text("Hello")
                .background(Color.red)
            Image("1") // 순서 중요
                .resizable() // 전체 크기만큼 잡힌다.
                .edgesIgnoringSafeArea(.all)
//                .aspectRatio(contentMode: .fit) // 원본 비율 유지하면서 가득 채우기 = .fit
    //            .padding()
    //            .frame(width: 300)
                .mask(
                    HStack(spacing: 0) {
                        VStack(spacing: 0) {
                            Circle()
                            Circle()
                        }
                        VStack(spacing: 0) {
                            Circle()
                            Circle()
                        }
                    }
                )
                .frame(width: 300, height: 300)
//                .padding(.bottom, 20)
            Image("1")
                .resizable() // 전체 크기만큼 잡힌다.
                .edgesIgnoringSafeArea(.all)
                .aspectRatio(contentMode: .fit) // 원본 비율 유지하면서 가득 채우기 = .fit
    //            .padding()
    //            .frame(width: 300)
                .mask(Circle())
                .padding(.bottom, 20)
        }
        
    }
}

struct ImageContentView_Previews: PreviewProvider {
    static var previews: some View {
        ImageContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
