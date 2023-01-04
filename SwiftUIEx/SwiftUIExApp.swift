//
//  SwiftUIExApp.swift
//  SwiftUIEx
//
//  Created by MDsqr on 2022/12/08.
//

import SwiftUI

@main
struct SwiftUIExApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            StopWatchContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
