//
//  NewsItemView.swift
//  BallGuru
//
//  Created by Barry on 08/09/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsItemView: View {
    var news : News
    var body: some View {
        
        VStack(alignment: .leading){
            
            if let imagURL = news.imageURL{
                WebImage(url: imagURL)
                    .resizable()
                    .placeholder {
                        ProgressView()
                    }
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: 250)
                    .clipped()
                    
            }
            
            Text(news.title)
                .font(.headline)
                .padding(.top,(news.imageURL != nil) ? 2 : 8)
                .padding(.bottom,1)
                .padding(.horizontal,8)
                .multilineTextAlignment(.leading)
            Text(news.description)
                .font(.caption)
                .lineLimit(2)
                .padding(.bottom,16)
                .padding(.horizontal,8)
                .multilineTextAlignment(.leading)
            
        }
        .background(.white)
        .padding(.bottom,4)
        .cornerRadius(4)
        .navigationTitle("News")
        
    }
}

//struct NewsItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsItemView()
//    }
//}
