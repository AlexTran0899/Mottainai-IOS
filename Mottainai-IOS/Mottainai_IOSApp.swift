//
//  Mottainai_IOSApp.swift
//  Mottainai-IOS
//
//  Created by 1234 on 10/11/24.
//

import SwiftUI

@main
struct Mottainai_IOSApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
