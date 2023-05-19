//
//  HomeManager.swift
//  ahmetmert_hw2
//
//  Created by Ahmet Mert ÖZ on 14.05.2023.
//

import Foundation
import AhmertNetworkManager

class HomeManager {
    
    static let shared = HomeManager()
    
    func getHomeItems(complete : @escaping ((Welcome?, String?)->())  ){
        
        let url = "https://api.nytimes.com/svc/topstories/v2/home.json?api-key=qrPAs1wOfA7VOFVmeRCHwcqRopH89zU9"
        
        //        NetworkManager.shared.request(type: Welcome.self, urlString: url, method: .get) { response in
        //
        //
        //            switch response{
        //
        //            case .success(let items):
        //                complete(items, nil)
        //            case .failure(let error):
        //                complete(nil, error.rawValue)
        //
        //
        //            }
        //        }
        
        AhmertNetworkManager.NetworkManager.shared.request(type: Welcome.self, urlString: url, method: .get) { response in
            
            switch response{
                
            case .success(let items):
                complete(items, nil)
            case .failure(let error):
                complete(nil, error.rawValue)
                
                
            }
        }
    }
}
