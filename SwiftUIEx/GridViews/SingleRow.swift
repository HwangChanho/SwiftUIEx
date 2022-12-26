//
//  SingleRow.swift
//  SwiftUIEx
//
//  Created by MDsqr on 2022/12/26.
//

import SwiftUI
import Foundation

struct SingleRow: View {
    
    let item: DogItem
    
    var body: some View {
        ZStack {
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack{
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.mainTitle)
                            .font(.headline)
                            .lineLimit(1)
                        Text(item.subTitle)
                            .font(.subheadline)
                            .lineLimit(1)
                    }
                    Spacer() // 오른쪽에 spacer가 들어간다..
                }
                .padding(.all, 10)
                .background(Color.gray.opacity(0.3))
            }
            
        }
    }
}

struct SingleRow_Previews: PreviewProvider {
    static var previews: some View {
        SingleRow(item: DogItem(mainTitle: "main", subTitle: "sub", imageName: "강아지1"))
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/350.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/250.0/*@END_MENU_TOKEN@*/))
    }
}
