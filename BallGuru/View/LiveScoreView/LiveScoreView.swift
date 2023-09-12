//
//  LiveScoreView.swift
//  BallGuru
//
//  Created by Barry on 08/09/2023.
//

import SwiftUI

struct LiveScoreView: View {
    
    @StateObject var viewModel = LiveScoreViewModel()
    
    var body: some View {
        NavigationView {
            List{
                ForEach(viewModel.leagues){ item in
                    ForEach(item.match ?? []) { match in
                        LiveScoreItemView(match: match,leagueName: item.leagueName,leageIcon: item.leagueIconUrl)
                            .shadow(radius: 5)
                            .listRowSeparator(.hidden)
                    }
                    .navigationTitle("BallGuru")
                }
                
                
                
            }
            .listStyle(.plain)
            .refreshable {
                await viewModel.getLiveScore()
            }
            .task {
                await viewModel.getLiveScore()
            }
        }
        .navigationTitle("Live Score")
        
    }
}

struct LiveScoreView_Previews: PreviewProvider {
    static var previews: some View {
        LiveScoreView()
    }
}
