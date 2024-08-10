//
//  MyProjectApp.swift
//  MyProject
//
//  Created by Muhammed Ahaj on 08/08/2024.
//

import SwiftUI

@main
struct MyProjectApp: App {
    @State private var networkMonitor = NetWorkMonitor()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(networkMonitor)
        }
    }
}
