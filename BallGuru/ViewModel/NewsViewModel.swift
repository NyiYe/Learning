//
//  NewsViewModel.swift
//  BallGuru
//
//  Created by Barry on 08/09/2023.
//

import Foundation

class NewsViewModel : ObservableObject{
    @Published var news : [News] = []
    
    init(){
        fetchNews()
    }
    
    func fetchNews(){
        
        let parameters = ["country" : "mm",
                          "apikey" : EndPoint.API_KEY]
        let componentService = URLComponentsService()
        let component =  componentService.makeComponent(baseUrl: EndPoint.NEWS_BASE_URL,parameters: parameters, path: EndPoint.NEWS_URL)
        
        guard let url = component.url else {
            print("invalid url ::\(String(describing: component.url?.absoluteString))")
            return
        }
        var request = URLRequest(url: URL(string: url.absoluteString )!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
              print(String(describing: error) )
            return
          }
            do {
                let newsResponse  =  try JSONDecoder().decode(NewsResponse.self, from: data)
                DispatchQueue.main.async {
                    self.news = newsResponse.results
                }
                
            } catch  {
                print(error.localizedDescription)
                debugPrint(error)
            }
        }

        task.resume()
        
        
        
        
        
        
    }
}
