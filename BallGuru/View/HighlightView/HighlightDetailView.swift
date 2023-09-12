//
//  HighlightDetailView.swift
//  BallGuru
//
//  Created by Barry on 08/09/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct HighlightDetailView: View {
    
    var snipet : Snippet
    
    var body: some View {
        ScrollView{
            VStack (alignment:.leading,spacing: 0){
                
                Video(videoID: "D5-C9UHdF-s")
                    .frame(minWidth: 300,maxWidth: .infinity,minHeight: 1500,maxHeight: .infinity)

//                Text(snipet.title)
//                    .font(.title2)
//                    .bold()
//                    .padding(.top)
//                    .padding(.horizontal , 8)
//                    .padding(.bottom,8)
//                Text(snipet.description)
//                    .font(.subheadline)
//                    .padding(.horizontal , 8)
//                    .padding(.bottom,4)
            }
            .toolbar {
                ToolbarItem {
                    Text(snipet.title)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
           
        }
    }
}

//struct HighlightDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        HighlightDetailView()
//    }
//}
