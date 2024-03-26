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
    @State public var selectedTab = "Web"
    @StateObject var model = WebViewModel()
    var body: some View {
        if model.selected == "Web" {
            TabView()
        }
        if model.selected == "Bookmarks" {
            BookmarksView()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
