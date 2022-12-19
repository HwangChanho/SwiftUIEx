//
//  GridContentView.swift
//  SwiftUIEx
//
//  Created by MDsqr on 2022/12/19.
//

import SwiftUI

// Grid
// CollectionVIew
// 바둑판

struct GridContentView: View {
    
    var columns: [GridItem] {
        [
            GridItem(.flexible(minimum: 10, maximum: 700)), // maximun 기준
         GridItem(.adaptive(minimum: 30, maximum: 100)), // minimum 기준
//         GridItem(.fixed(100))
        ]
    }
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns) {
                Text("hello")
                Image(systemName: "pencil") // ViewModifier 이용가능
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "pencil")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "pencil")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "pencil")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "pencil")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "pencil")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "pencil")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "pencil")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "pencil")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}

struct GridContentView_Previews: PreviewProvider {
    static var previews: some View {
        GridContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
