//
//  VoitureViewModel.swift
//  Carhabti
//
//  Created by Mac-Mini_2021 on 12/05/2022.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit.UIImage

class PlantViewModel{
    static let shareinstance = PlantViewModel()

    func addPlant(plant: Plant, uiImage: UIImage, completed: @escaping (Bool) -> Void ) {
        print("hi")
     
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(uiImage.jpegData(compressionQuality: 0.5)!, withName: "photo" , fileName: "image.jpeg", mimeType: "image/jpeg")
            
            let ParametersS = [ "name": plant.name!,
                                "description": plant.description!,
                              
                              
            ] as [String : Any]
            for (key, value) in ParametersS {
                if let temp = value as? String {
                    multipartFormData.append(temp.data(using: .utf8)!, withName: key)
                }
                if let temp = value as? Int {
                    multipartFormData.append("\(temp)".data(using: .utf8)!, withName: key)
                }
                if let temp = value as? Double {
                    multipartFormData.append("\(temp)".data(using: .utf8)!, withName: key)
                
                }
                
                print(multipartFormData)
            }
            },to:HOSTS_URL+"/store",
        method: .post)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    print("Success")
                    completed(true)
                case let .failure(error):
                    completed(false)
                    print(error)
                }
            }
    }
  

    func makeItem(jsonItem: JSON) -> Plant {
   
    Plant(
        _id: jsonItem["_id"].stringValue,
        name: jsonItem["name"].stringValue,
        description: jsonItem["description"].stringValue,
       photo: jsonItem["photo"].stringValue

     
    )
}
}
