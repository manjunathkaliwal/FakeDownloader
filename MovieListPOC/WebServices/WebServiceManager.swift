//
//  ServiceManager.swift
//  MoviesPOCTests
//
//  Created by Manjunath Kaliwal on 5/15/19.
//  Copyright © 2019 Manjunath Kaliwal. All rights reserved.
//

import UIKit

/**
 The purpose of the `ServiceIdentifier` is identify the service identifier when multiple service being called
 */
public enum ServiceIdentifier {
    case getMovies
}

/**
 ServiceType to identify the type of the service being called.
 */
public enum ServiceType: String {
    case GET
    case POST
    case PUT
    case DELETE
}

class WebServiceManager{
    
    static let sharedInstance = WebServiceManager()
    
    func getData<T : Decodable>(_ completion: @escaping ([T])->(),
                                onError: @escaping (_ error:Error)->()) {
        
        let moviesURL =  ServiceUrl.getMoviesURL
        let getNewsService = BaseService(serviceIdentifier: .getMovies, serviceType: .GET, serviceURL: moviesURL)
        getNewsService.start(success: { (responseData) in
            
            do {
                
                let obj = try JSONDecoder().decode([T].self, from: responseData as! Data)
                print(obj)
                completion(obj)
                
            } catch {
                print(error.localizedDescription)
                onError(error)
                
            }
            
            
        }) { (error) in
            onError(error)
        }
        
    }}

