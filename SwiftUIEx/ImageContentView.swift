//
//  ImageContentView.swift
//  SwiftUIEx
//
//  Created by MDsqr on 2022/12/08.
//

import SwiftUI

struct ImageContentView: View {
    var body: some View {
        Text("Hello, world!").padding()
    }
}

struct ImageContentView_Previews: PreviewProvider {
    static var previews: some View {
        ImageContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
