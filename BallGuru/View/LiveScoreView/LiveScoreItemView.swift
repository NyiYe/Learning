//
//  MatchItemView.swift
//  BallGuru
//
//  Created by Barry on 07/09/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct LiveScoreItemView: View {
    
    let match : Match
    let leagueName : String
    let leageIcon : URL?
    var body: some View {
        VStack(alignment:.center,spacing: 16){
            HStack{
                Text(match.time)
                Spacer()
                //                Text(leagueName)
                //                Spacer()
                WebImage(url: leageIcon)
                    .resizable()
                    .placeholder {
                        ProgressView()
                    }
                    .frame(maxWidth: 24, maxHeight: 24)
                
            }
            HStack(alignment:.center){
                Text(match.homeTeamName ?? "")
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal,4)
                WebImage(url: match.homeTeamIconUrl)
                    .resizable()
                    .placeholder {
                        ProgressView()
                           
                    }
                    .frame(maxWidth: 24, maxHeight: 24)
                    
                Text("Vs")
                    .padding(.horizontal,4)
                WebImage(url: match.awayTeamIconUrl)
                    .resizable()
                    .placeholder {
                        ProgressView()
                           
                    }
                    .frame(maxWidth: 24, maxHeight: 24)
                
                Text(match.awayTeamName ?? "")
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal,4)
                
                
            }
            
            HStack(alignment:.top){
                Text("1080 hd")
                Spacer()
                Text("Watch Now")
                Spacer()
                VStack{
                    Text("Predict")
                    Text("\(match.homeFinalResult ?? "0") - \(match.awayFinalResult ?? "0")" )
                   
//                    Text("(2-2)")
                    
                }
                
            }
        }
        .padding()
        
        .background(Color("Primary"))
        .cornerRadius(16)
        
    }
}

//struct MatchItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        MatchItemView()
//    }
//}
