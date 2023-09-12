//
//  LiveScoreViewModel.swift
//  BallGuru
//
//  Created by Barry on 07/09/2023.
//

import Foundation

class LiveScoreViewModel : ObservableObject{
    
    @Published var leagues : [League] = []
    
    func getLiveScore() async{
        
        let urlComponentService = URLComponentsService()
        let date :Date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: date)
        
        print(dateString)
        
        let parameters = ["date" : dateString]
        let component = urlComponentService.makeComponent(parameters: parameters,path: EndPoint.ESTIMATION_BY_DATE_URL)
        guard let url = component.url else{
            print("invalid url")
            return
        }
        print(url.absoluteString)
       
        var request = URLRequest(url: URL(string: url.absoluteString )!,timeoutInterval: Double.infinity)
        request.httpMethod = "POST"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
              print(String(describing: error))
            return
          }
            do {
                let data  =  try JSONDecoder().decode(DetermineResponse.self, from: data)
                DispatchQueue.main.async {
                    if let data = data.data{
                        self.leagues = data
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
