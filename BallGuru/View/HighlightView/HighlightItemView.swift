//
//  HighlightItemView.swift
//  BallGuru
//
//  Created by Barry on 08/09/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct HighlightItemView: View {
    
    var snipet : Snippet
    var body: some View {
        VStack(alignment: .leading){
            
            if let imagURL = snipet.thumbnails.medium?.url{
                WebImage(url: URL(string: imagURL))
                    .resizable()
                    .placeholder {
                        ProgressView()
                    }
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: 250)
                    .clipped()
                    
            }
            
            Text(snipet.title)
                .font(.headline)
                .padding(2)
                .padding(.bottom,1)
                .padding(.horizontal,8)
                .multilineTextAlignment(.leading)
            Text(snipet.description)
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

//struct HighlightItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        HighlightItemView(snipet: <#Snippet#>)
//    }
//}
