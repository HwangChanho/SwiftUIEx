//
//  StopWatchContentView.swift
//  SwiftUIEx
//
//  Created by AlexHwang on 2023/01/04.
//

import SwiftUI

// StopWatchContentView

struct StopWatchContentView: View {
    
    @State private var progress: CGFloat = 0
    
    var body: some View {
        VStack {
            Slider(value: $progress)
                .padding()
        }
    }
}

struct StopWatchContentView_Previews: PreviewProvider {
    static var previews: some View {
        StopWatchContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
