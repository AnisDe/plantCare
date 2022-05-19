//
//  suiviViewModel.swift
//  plantcare
//
//  Created by Mac-Mini-2021 on 18/05/2022.
//
import SwiftyJSON
import Alamofire
import UIKit.UIImage
import Foundation
class SuiviViewModel{
    static let sharedInstance = SuiviViewModel()
    
    func addsuivi(suivi: Suivi, uiImage: UIImage, completed: @escaping (Bool) -> Void ) {
        print("hi")
     
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(uiImage.jpegData(compressionQuality: 0.5)!, withName: "photo" , fileName: "image.jpeg", mimeType: "image/jpeg")
            
            let ParametersS = [ "name": suivi.name!,
                                
                              
                              
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
            },to:HOST_URLL+"/store",
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
    
    func recupererToutSuivi( completed: @escaping (Bool, [Suivi]?) -> Void ) {
        AF.request(HOST_POST_URL + "/suiv/fetchAll",
                   method: .get)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    let jsonData = JSON(response.data!)
                    
                    var suivi : [Suivi]? = []
                    for singleJsonItem in jsonData["suivy"] {
                        suivi!.append(self.makePlant(jsonItem: singleJsonItem.1))
                        
                    }
                    completed(true, suivi)
                case let .failure(error):
                    debugPrint(error)
                    completed(false, nil)
                }
            }
    }
    
    func makePlant(jsonItem: JSON) -> Suivi {
        var BParray : [String] = []
                for singleJsonItem in jsonItem["photo"]   {
                    BParray.append(singleJsonItem.1.stringValue)
                }
        return Suivi(
            _id: jsonItem["_id"].stringValue,
            name: jsonItem["name"].stringValue,
            description: jsonItem["description"].stringValue,
            photo: BParray
            
            
        )
    }
    
}
