//
//  WebViewNavigationDelegate.swift
//  Ion
//
//  Created by Zeb Crenshaw on 4/22/23.
//

import WebKit

class WebViewNavigationDelegate: NSObject, WKNavigationDelegate {
    @Published var a: String = ""
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let a = ""
        if let urlStr = navigationAction.request.url?.absoluteString {
            WebViewModel().aturl = "\(urlStr)"
        }
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        // TODO
        decisionHandler(.allow)
    }
}
