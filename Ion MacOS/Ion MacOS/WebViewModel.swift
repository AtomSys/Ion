//
//  WebViewModel.swift
//  Ion MacOS
//
//  Created by Zeb Crenshaw on 5/4/23.
//
import Combine
import WebKit

class WebViewModel: ObservableObject {
    let webView: WKWebView

    private let navigationDelegate: WebViewNavigationDelegate

    init() {
        let configuration = WKWebViewConfiguration()
        configuration.websiteDataStore = .nonPersistent()
        webView = WKWebView(frame: .zero, configuration: configuration)
        navigationDelegate = WebViewNavigationDelegate()

        webView.navigationDelegate = navigationDelegate
        setupBindings()
    }

    @Published var urlString: String = ""
    @Published var canGoBack: Bool = false
    @Published var canGoForward: Bool = false
    @Published var isLoading: Bool = false
    @Published var docShown: Bool = true
    @Published var aturl: String = ""
    @Published var test: Bool = true
    @Published var selected: String = "Web"
    

    private func setupBindings() {
        webView.publisher(for: \.canGoBack)
            .assign(to: &$canGoBack)

        webView.publisher(for: \.canGoForward)
            .assign(to: &$canGoForward)

        webView.publisher(for: \.isLoading)
            .assign(to: &$isLoading)

    }

    func loadUrl() {
        loadPage(url: urlString)
    }

    func goForward() {
        webView.goForward()
    }

    func goBack() {
        webView.goBack()
    }
    func reloadPage() {
        webView.reload()
    }
    func searchWork(){
        let str = "\(urlString)"
        let replaced = str.replacingOccurrences(of: " ", with: "%20")
        let url = "https://www.google.com/search?q=\(replaced)"
        loadPage(url: url)
    }
    func loadPage(url: String) {
        if url.contains("https://") {
        } else {
            let url = "https://\(url)"
            guard let urls = URL(string: url) else {
                return
            }
            webView.customUserAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 13_3_1) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.4 Safari/605.1.15"
            webView.load(URLRequest(url: urls))
            print("Loaded URL: \(url)")
        }
        guard let urls = URL(string: url) else {
            return
        }
        webView.customUserAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 13_3_1) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.4 Safari/605.1.15"
        webView.load(URLRequest(url: urls))
        print("Loaded URL: \(url)")
    }
    func hideDoc(){
        docShown = false
    }
    func showBookmarks() {
        selected = "Bookmarks"
    }
}
