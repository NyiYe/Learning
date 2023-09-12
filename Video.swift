//
//  Video.swift
//  BallGuru
//
//  Created by Barry on 11/09/2023.
//

import Foundation
import WebKit
import SwiftUI

struct Video : UIViewRepresentable{
    let videoID : String
    func makeUIView(context : Context) -> some WKWebView{
        return WKWebView()
    }
    func updateUIView(_ uiView : UIViewType , context : Context){
        guard let youTubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)")else{return}
        uiView.scrollView.isScrollEnabled = true
        uiView.load(URLRequest(url: youTubeURL))
    }
    
}

