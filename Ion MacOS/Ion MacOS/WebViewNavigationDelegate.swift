//
//  WebViewNavigationDelegate.swift
//  Ion MacOS
//
//  Created by Zeb Crenshaw on 5/4/23.
//

import WebKit

class WebViewNavigationDelegate: NSObject, WKNavigationDelegate {
    @Published var a: String = ""
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let a = navigationAction.request.url {
            decisionHandler(.allow)
            print(a)
        }
        }

    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        // TODO
        decisionHandler(.allow)
    }
}
