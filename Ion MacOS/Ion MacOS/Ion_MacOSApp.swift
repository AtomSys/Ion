//
//  Ion_MacOSApp.swift
//  Ion MacOS
//
//  Created by Zeb Crenshaw on 5/4/23.
//

import SwiftUI
import WebKit

@main
struct Ion_MacOSApp: App {
    @StateObject var model = WebViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            CommandMenu("Visibility") {
                Button("Show") {
                    model.docShown = true
                }
                .keyboardShortcut("S")
                
                Button("Hide") {
                    model.docShown = false
                }
                .keyboardShortcut("H")
            }
        }

    }
}
