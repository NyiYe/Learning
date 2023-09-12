//
//  HighlightView.swift
//  BallGuru
//
//  Created by Barry on 08/09/2023.
//

import SwiftUI

struct HighlightView: View {
    @StateObject var viewModel = HighlightViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView{
                ForEach(viewModel.youTubeItems, id: \.id){highlight in
                    NavigationLink {
                        HighlightDetailView(snipet: highlight.snippet)
                    } label: {
                        HighlightItemView(snipet: highlight.snippet)
                            .navigationTitle("Highlight")
                    }
                    .foregroundColor(.black)

                   
                    
                }
            }
        }
        .task {
           await viewModel.getHighlight()
        }
    }
}

struct HighlightView_Previews: PreviewProvider {
    static var previews: some View {
        HighlightView()
    }
}
