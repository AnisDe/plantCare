//
//  HomeViewModel.swift
//  plantcare
//
//  Created by Apple Esprit on 24/4/2022.
//

import SwiftyJSON
import Alamofire
import UIKit.UIImage
import Foundation

class HomeViewModel{
    static let sharedInstance = HomeViewModel()
    
    func recupererToutPlant( completed: @escaping (Bool, [Home]?) -> Void ) {
        AF.request(HOSTS_URL + "/show",
                   method: .get)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    let jsonData = JSON(response.data!)
                    
                    var home : [Home]? = []
                    for singleJsonItem in jsonData["planti"] {
                        home!.append(self.makePlant(jsonItem: singleJsonItem.1))
                        
                    }
                    completed(true, home)
                case let .failure(error):
                    debugPrint(error)
                    completed(false, nil)
                }
            }
    }
    
    func makePlant(jsonItem: JSON) -> Home {
        
        return Home(
            _id: jsonItem["_id"].stringValue,
            name: jsonItem["name"].stringValue,
            description: jsonItem["description"].stringValue,
            photo: jsonItem["photo"].stringValue
            
            
        )
    }
    
}

