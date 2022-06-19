//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Carson Gross on 6/18/22.
//

import SwiftUI

@main
struct FriendFaceApp: App {
    @StateObject private var dataController = DataController()

    
    var body: some Scene {
        WindowGroup {
            ListView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
