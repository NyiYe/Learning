//
//  URLComponentService.swift
//  BallGuru
//
//  Created by Barry on 07/09/2023.
//

import Foundation


struct URLComponentsService{
    
    func makeComponent( scheme : String = EndPoint.SCHEME,
                        baseUrl : String = EndPoint.BASE_URL,
                        parameters : [String : String]? = nil,
                        port : Int? = nil,
                        path : String? = nil) -> URLComponents {

        var components    = URLComponents()
        
        components.host   = baseUrl
        components.scheme = EndPoint.SCHEME
        if let port = port{
            components.port = port
        }
        if let path = path{
            components.path = path
        }
       
        if let parameters = parameters {
            var items : [URLQueryItem] = []
            for (key, value) in parameters {
                items.append(URLQueryItem(name: key, value: value))
            }
            components.queryItems = items
        }
        
        //print("components : \(components)")
        print("url : \(String(describing: components.url))")
        return components
    }
}


struct APIRequest<T: Decodable> {
    let decodeJSON  : (Data) throws -> T
}

extension APIRequest {
    init(){
        self.decodeJSON  = { data in
            return try JSONDecoder().decode(T.self, from: data)
        }
    }
}
