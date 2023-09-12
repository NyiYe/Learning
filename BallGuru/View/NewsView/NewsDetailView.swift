//
//  NewsDetailView.swift
//  BallGuru
//
//  Created by Barry on 08/09/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsDetailView: View {
    var news : News
    var body: some View {
        ScrollView{
            VStack (alignment:.leading,spacing: 0){
                if let url = news.imageURL{
                    WebImage(url:url)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity,maxHeight: 250)
                        .clipped()
                }

                Text(news.title)
                    .font(.title2)
                    .bold()
                    .padding(.top)
                    .padding(.horizontal , 8)
                    .padding(.bottom,8)
                Text(news.description)
                    .font(.subheadline)
                    .padding(.horizontal , 8)
                    .padding(.bottom,4)
            }
            .toolbar {
                ToolbarItem {
                    Text(news.title)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
           
        }
    }
}

//struct NewsDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsDetailView()
//    }
//}
