//
//  NetworkHelper.swift
//  ahmetmert_hw2
//
//  Created by Ahmet Mert ÖZ on 14.05.2023.
//

import Foundation

enum HTTPMethods : String {

    case get = "GET"
    case post = "POST"
    
}

enum ErrorTypes : String, Error{
    case invalidData = "invalid Data"
    case invalidURL = "invalid URL"
    case generalError = "An error happened"
}

class NetworkHelper {
    
    static let shared = NetworkHelper()
    
    let baseURL = ""
    let header = ["":""]
    
    func saveToken(token : String){
        
    }
    
} 
