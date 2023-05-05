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
    
    @StateObject var model = WebViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
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
                        TextField("Tap an url",
                                  text: $model.urlString)
                            .disableAutocorrection(true)
                            .padding(10)
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
                            }
                        Button(action: {
                            model.reloadPage  ()
                        }, label: {
                            Image(systemName: "arrow.clockwise")
                        })
                        Spacer()
                    }
                    .background(Color.gray)
                    .cornerRadius(30)
                    Button(action: {
                        model.loadUrl()
                    }, label: {
                        Image(systemName: "arrow.right")
                    })
                }.padding(10)
                
                ZStack {
                    WebView(webView: model.webView)
                    
                    if model.isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
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
                        }
                
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
