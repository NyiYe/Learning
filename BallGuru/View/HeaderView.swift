//
//  HeaderView.swift
//  BallGuru
//
//  Created by Barry on 07/09/2023.
//

import SwiftUI

struct HeaderView: View {
    let url : URL?
    let name : String
    var body: some View {
        HStack{
            
            
            AsyncImage(
                url: url,
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 30, maxHeight: 30)
                },
                placeholder: {
                    ProgressView()
                }
            )
            Text(name)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(url: nil,name: "Primer League")
    }
}
