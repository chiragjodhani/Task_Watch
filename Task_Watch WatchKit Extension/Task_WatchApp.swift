//
//  Task_WatchApp.swift
//  Task_Watch WatchKit Extension
//
//  Created by Eryushion Techsol on 16/02/21.
//

import SwiftUI

@main
struct Task_WatchApp: App {
    let container = PersistenceController.shared.container
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environment(\.managedObjectContext, container.viewContext)
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
