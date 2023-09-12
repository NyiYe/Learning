//
//  NewsView.swift
//  BallGuru
//
//  Created by Barry on 08/09/2023.
//

import SwiftUI

struct NewsView: View {
    @StateObject var viewModel = NewsViewModel()
    var body: some View {
        NavigationView {
            ScrollView{
                ForEach(viewModel.news){ news in
                    VStack(alignment: .leading,spacing: 0) {
                        NavigationLink {
                            NewsDetailView(news: news)
                            
                        } label: {
                            VStack(alignment:.leading){
                                NewsItemView(news: news)
//                                    .padding(.bottom,4)
//                                Divider()
//                                    .background(.gray)
//                                    .padding(.horizontal)
                            }
                            .shadow(radius: 1)
                            .padding(.bottom,4)
                           
                                
                                .foregroundColor(.black)
                        }
                    }
                    
                    
                }
                .listStyle(.plain)
                .refreshable {
                    viewModel.fetchNews()
                    
                }
            }

        }
        .navigationTitle("News")
        
        
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
