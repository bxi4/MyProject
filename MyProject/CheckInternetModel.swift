//
//  CheckInternetModel.swift
//  MyProject
//
//  Created by Muhammed Ahaj on 10/08/2024.
//

import Foundation
import Network

@Observable
class NetWorkMonitor {
    private var networkMonitor = NWPathMonitor()
    private var workerQueue = DispatchQueue(label: "Monitor")
    var isConnected = false
    
    init() {
        networkMonitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
        }
        networkMonitor.start(queue: workerQueue)
    }
}
