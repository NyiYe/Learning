//
//  URLRequestService.swift
//  BallGuru
//
//  Created by Barry on 07/09/2023.
//

import Foundation

class URLRequestService{
    public static let shared = URLRequestService()

     func makeRequest (
        url : URL ,
        method : String = "GET",
        payload : PayLoad ,
        httpBody : Data? = nil,
        token : String? = nil,
        boundary : String? = nil
        
    )-> URLRequest{
        
        var request = URLRequest(url:url)
        request.httpMethod = method
        
        if let httpBody = httpBody{
            request.httpBody = httpBody
        }
        switch payload {
            
        case .FORM_DATA:
            if let boundary = boundary{
                request.setValue("multipart/form-data; boundary=" + boundary, forHTTPHeaderField: "Content-Type")
            }
            
        case .FORM_URL_ENCODED:
            print("form-url encoded")
            
        case .BINARY:
            print("binary")
        }
        if let token = token{
            request.addValue(token, forHTTPHeaderField: "Authorization")
        }
        
        return request
    }
}
