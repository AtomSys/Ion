//
//  ContentView.swift
//  Ion MacOS
//
//  Created by Zeb Crenshaw on 5/4/23.
//

import Combine
import WebKit
import SwiftUI

struct ContentView: View {
    var tabs = ["Web"]
    @State public var selectedTab = "Web"
    @StateObject var model = WebViewModel()
    var body: some View {
        if selectedTab == "Tab 1" {
            TabView()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
