//
//  WebView.swift
//  Ion MacOS
//
//  Created by Zeb Crenshaw on 5/4/23.
//

import WebKit
import SwiftUI
import AppKit


struct WebView: NSViewRepresentable {
    
    typealias NSViewType = WKWebView
        
    let webView: WKWebView
        
    func makeNSView(context: Context) -> WKWebView {
        return webView
    }
        
    func updateNSView(_ uiView: WKWebView, context: Context) { }
        
}
