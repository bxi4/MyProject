//
//  ContentView.swift
//  MyProject
//
//  Created by Muhammed Ahaj on 08/08/2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(NetWorkMonitor.self) private var networkMonitor
    var titleNavigation: String = "My Project Name"
    var body: some View {
        NavigationStack {
            ZStack {
                Color(uiColor: .blue).ignoresSafeArea()
                VStack(spacing: 20){
                    Text("Internet Status :")
                        .font(.headline)
                    if networkMonitor.isConnected {
                        Label("Connected", systemImage: "wifi")
                            .font(.title)
                            .foregroundStyle(Color.green)
                    } else {
                        Label("Not Connected", systemImage: "wifi.slash")
                            .symbolEffect(.pulse)
                            .font(.title)
                            .foregroundStyle(Color.red)
                        Text("This is your [Url] (https://www.apple.com)")
                    }
                    
//                    Image(systemName: networkMonitor.isConnected ? "wifi" : "wifi.slash")
//                        .font(.system(size: 70))
//                        .foregroundStyle(networkMonitor.isConnected ? .green: .red)
//                    Text(networkMonitor.isConnected ? "Connected" : "DisConnected \n Try Again")
//                        .multilineTextAlignment(.center)
//                        .font(.title)
//                        .foregroundStyle(networkMonitor.isConnected ? .green: .red)
                }
            }
            .navigationTitle(titleNavigation)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button(action: {}, label: {
                        Image(systemName: "person")
                            .foregroundColor(.black)
                            .background(
                                Circle()
                                    .fill(.white)
                                    .frame(width: 50, height: 37)
                            )
                    })
                    
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {}, label: {
                        Image(systemName: "person")
                            .foregroundColor(.black)
                            .background(
                                Circle()
                                    .fill(.white)
                                    .frame(width: 50, height: 37)
                            )
                    })
                }
            }
        }
//        .onAppear {
//            // تطبيق مظهر مخصص عند الظهور
//            let appearance = UINavigationBarAppearance()
//            appearance.configureWithOpaqueBackground()
//            appearance.backgroundColor = UIColor.blue // اختر اللون المناسب هنا
//            UINavigationBar.appearance().standardAppearance = appearance
//            UINavigationBar.appearance().scrollEdgeAppearance = appearance
//        }
    }
    
}

#Preview {
    ContentView()
        .environment(NetWorkMonitor())
}
