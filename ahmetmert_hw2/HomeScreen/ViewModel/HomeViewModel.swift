//
//  HomeViewModel.swift
//  ahmetmert_hw2
//
//  Created by Ahmet Mert ÖZ on 14.05.2023.
//

import Foundation
import AhmertNetworkManager

class HomeViewModel {
    
    var result : Welcome?
    
    func getHomeItems(complete : @escaping((String?)->())){
        
        HomeManager.shared.getHomeItems { welcomeItem, errorMessage in
            
            if let welcomeItem = welcomeItem {
                self.result = welcomeItem
            }
            
            complete(errorMessage)
        }
    }
}
