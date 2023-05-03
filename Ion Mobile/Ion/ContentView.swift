//
//  ContentView.swift
//  Ion
//
//  Created by Zeb Crenshaw on 4/22/23.
//

import Combine
import WebKit
import SwiftUI

struct ContentView: View {
    
    @StateObject var model = WebViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                HStack(spacing: 10) {
                    HStack {
                        TextField("Tap an url",
                                  text: $model.urlString)
                            .keyboardType(.URL)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .padding(10)
                        Spacer()
                    }
                    .background(Color.white)
                    .cornerRadius(30)
                    Button(action: {
                        model.loadUrl()
                    }, label: {
                        Image(systemName: "arrowshape.right")
                    })
                }.padding(10)
                
                ZStack {
                    WebView(webView: model.webView)
                    
                    if model.isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                    }
                }
                
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
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
                    model.reloadPage()
                }, label: {
                    Image(systemName: "arrow.clockwise")
                })
                Text("\(model.urlString)")
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
