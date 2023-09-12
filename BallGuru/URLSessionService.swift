//
//  URLSessionService.swift
//  BallGuru
//
//  Created by Barry on 07/09/2023.
//

import Foundation


enum PayLoad {
    case FORM_DATA,FORM_URL_ENCODED,BINARY
}


class URLSessionService : NSObject, URLSessionTaskDelegate, URLSessionDataDelegate {
    var urlComponentsService  = URLComponentsService()
    
    var urlRequestService = URLRequestService()
    
    
    var taskFileURLMap: [URL: URL] = [:]
    var retryCount  = 0
    let  retryLimit = 3
    
    func processURLSessionRequest(
        
        requestParams : [String : Any]?,
        method : String,
        path : String,
        port : Int? = nil,
        payload : PayLoad? = nil) async throws{
            
           
        }
    
    
   
    

}
