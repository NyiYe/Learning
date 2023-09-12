//
//  ContentView.swift
//  BallGuru
//
//  Created by Barry on 07/09/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = LiveScoreViewModel()
    var body: some View {
        
        TabView {
            HighlightView()
                .tabItem {
                    Label("Matches", systemImage: "video.square")
                       
                }
            NewsView()
                .tabItem {
                    Label("News", systemImage: "newspaper")
                        
                }
            LiveScoreView()
                .tabItem {
                    Label("Matches", systemImage: "sportscourt")
                       
                }
           
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
