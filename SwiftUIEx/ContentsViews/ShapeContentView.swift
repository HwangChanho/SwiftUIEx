//
//  ShapeContentView.swift
//  SwiftUIEx
//
//  Created by AlexHwang on 2022/12/11.
//

import SwiftUI

struct ShapeContentView: View {
    var body: some View {
        Rectangle()
            .fill(Color.blue)
            .frame(width: 100,height: 100)
    }
}

struct ShapeContentView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
