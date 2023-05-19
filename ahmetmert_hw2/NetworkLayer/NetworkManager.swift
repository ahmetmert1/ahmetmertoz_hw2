//
//  NetworkManager.swift
//  ahmetmert_hw2
//
//  Created by Ahmet Mert ÖZ on 14.05.2023.
//

//import Foundation
//
//class NetworkManager {
//    
//    static let shared = NetworkManager()
//    
//    func request<T: Codable>(type : T.Type, urlString: String, method : HTTPMethods, completion : @escaping ((Result<T, ErrorTypes>)->())){
//        
//        let session = URLSession.shared
//        
//        if let url = URL(string: urlString){
//            
//            var request = URLRequest(url: url)
//            request.httpMethod = method.rawValue
//            
//            let dataTask = session.dataTask(with: request) { data, response, error in
//                
//                if let _ = error {
//                    //has error
//                    
//                    completion(.failure(.generalError))
//                    
//                }else if let data = data {
//                    //has data
//                    
//                    self.handleResponse(data: data) { response in
//                        completion(response)
//                    }
//                    
//                }else {
//                    completion(.failure(.invalidURL))
//                }
//            }
//            dataTask.resume()
//        }
//        
//    }
//    
//    fileprivate func handleResponse<T: Codable>(data : Data, completion : @escaping ((Result<T, ErrorTypes>)->())){
//        
//        do {
//            
//            let result = try JSONDecoder().decode(T.self, from: data)
//            completion(.success(result))
//            
//        }catch{
//            completion(.failure(.invalidData))
//        }
//        
//    }
//}


