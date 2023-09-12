//
//  HighlightViewModel.swift
//  BallGuru
//
//  Created by Barry on 11/09/2023.
//

import Foundation

class HighlightViewModel : ObservableObject{
    
    @Published var youTubeItems : [DataItem] = []
    
    
    func getHighlight() async{
        
        let urlComponentService = URLComponentsService()
        let parameters = ["part" : "snippet" ,
                          "maxResults" : "50" ,
                          "playlistId" : "PLQ_voP4Q3cffZYz6sVkSigiLfAZI_5vba",
                          "key" : "AIzaSyAmK0s2yx8xN4ln4NgELmrkVqIyktkeCus"]
        let component = urlComponentService.makeComponent(baseUrl: EndPoint.BASE_YOUTUBE_URL,parameters: parameters,path: EndPoint.YOUTUBE_PLAYLIST_ITEM)
        guard let url = component.url else{
            print("invalid url")
            return
        }
        
        var request = URLRequest(url: URL(string: url.absoluteString)!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            do {
                let data  =  try JSONDecoder().decode(HighlightResponse.self, from: data)
                DispatchQueue.main.async {
                    print("success")
                    
                    if let items = data.items{
                        self.youTubeItems = items
                    }
                    
                }
                
            } catch  {
                print(error.localizedDescription)
                debugPrint(error)
            }
        }
        
        task.resume()
        
    }
}
