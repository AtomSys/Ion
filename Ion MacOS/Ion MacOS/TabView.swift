//
//  TabView.swift
//  Ion MacOS
//
//  Created by Zeb Crenshaw on 2/5/24.
//

import Foundation
import Combine
import WebKit
import SwiftUI

struct TabView: View {
    @StateObject var model = WebViewModel()
    var body: some View {
            ZStack(alignment: .top) {
                Color.gray
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    HStack(spacing: 10) {
                        HStack {
                            Button(action: {
                                model.goBack()
                            }, label: {
                                Image(systemName: "chevron.left")
                            })
                            .disabled(!model.canGoBack)
                            Button(action: {
                                model.goForward()
                            }, label: {
                                Image(systemName: "chevron.right")
                            })
                            .disabled(!model.canGoForward)
                            TextField("Type a url or a search",
                                      text: $model.urlString)
                            .disableAutocorrection(true)
                            .padding(10)
                            Button(action: {
                                model.reloadPage  ()
                            }, label: {
                                Image(systemName: "arrow.clockwise")
                            })
                            Button(action: {
                                model.loadUrl()
                            }, label: {
                                Image(systemName: "arrow.right")
                            })
                        }
                        .background(Color.gray)
                        .cornerRadius(30)
                    }.padding(10)
                    
                    ZStack {
                        WebView(webView: model.webView)
                        
                        if model.isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                        }
                        
                    }
                            
                            
                        }
                        
                        .focusable()
                        .touchBar {
                            Button(action: {
                                model.loadUrl()
                            }, label: {
                                Image(systemName: "arrow.right")
                            })
                            Button(action: {
                                model.goBack()
                            }, label: {
                                Image(systemName: "chevron.left")
                            })
                            .disabled(!model.canGoBack)
                            Button(action: {
                                model.goForward()
                            }, label: {
                                Image(systemName: "chevron.right")
                            })
                            .disabled(!model.canGoForward)
                            Button(action: {
                                model.searchWork()
                            }, label: {
                                Image(systemName: "magnifyingglass")
                            })
                        }
                    }
                }
                
            }
