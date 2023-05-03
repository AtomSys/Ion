//
//  WebView.swift
//  Ion
//
//  Created by Zeb Crenshaw on 4/22/23.
//

import UIKit
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    typealias UIViewType = WKWebView

    let webView: WKWebView

    func makeUIView(context: Context) -> WKWebView {
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) { }
}
