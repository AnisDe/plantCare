

import SwiftyJSON
import Alamofire
import UIKit.UIImage

class CommentaireViewModel {
    
    static let sharedInstance = CommentaireViewModel()
    
    func recupererCommentaireParPublication(idPublication: String,  completed: @escaping (Bool, [Commentaire]?) -> Void ) {
        AF.request(HOST_URL + "/Comment/par-post",
                   method: .post,
                   parameters: [
                    "_id": idPublication
                   ], encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    let jsonData = JSON(response.data!)
                    
                    var commentaires : [Commentaire]? = []
                    for singleJsonItem in jsonData["com"]["comments"] {
                        
                        commentaires!.append(self.makeCommentaire(jsonItem: singleJsonItem.1))
                    }
                    completed(true, commentaires)
                case let .failure(error):
                    debugPrint(error)
                    completed(false, nil)
                }
            }
    }
    
    func ajouterCommentaire(idPublication: String, commentaire: Commentaire, completed: @escaping (Bool) -> Void ) {
        AF.request(HOST_URL + "/Comment",
                   method: .post,
                   parameters: [
                    "description": commentaire.description!,
                    "date": DateUtils.formatFromDate(date: commentaire.date!),
                    "post": idPublication,
                    "user": UserDefaults.standard.string(forKey: "idUser")!
                   ], encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    completed(true)
                case let .failure(error):
                    debugPrint(error)
                    completed(false)
                }
            }
    }
    
    func modifierCommentaire(commentaire: Commentaire, completed: @escaping (Bool) -> Void ) {
        AF.request(HOST_URL + "/Comment",
                   method: .put,
                   parameters: [
                    "_id": commentaire._id!,
                    "description": commentaire.description!
                   ], encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    completed(true)
                case let .failure(error):
                    debugPrint(error)
                    completed(false)
                }
            }
    }
    
    func supprimerCommentaire(_id: String?, completed: @escaping (Bool) -> Void ) {
        AF.request(HOST_URL + "/Comment",
                   method: .delete,
                   parameters: [
                    "_id": _id!
                    
                   ], encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    completed(true)
                case let .failure(error):
                    debugPrint(error)
                    completed(false)
                }
            }
    }
    
    func makeCommentaire(jsonItem: JSON) -> Commentaire {
        Commentaire(
            _id: jsonItem["_id"].stringValue,
            description: jsonItem["description"].stringValue,
            date: DateUtils.formatFromString(string: jsonItem["date"].stringValue),
            Plant: makePublication(jsonItem: jsonItem["publication"]),
            User: makeUtilisateur(jsonItem: jsonItem["utilisateur"])
        )
    }
    
    func makeUtilisateur(jsonItem: JSON) -> User {
        return User(
            _id: jsonItem["_id"].stringValue,
            name: jsonItem["name"].stringValue,
            email: jsonItem["email"].stringValue,
            phone: jsonItem["phone"].stringValue,
            password: jsonItem["password"].stringValue,
            isVerified: jsonItem["isVerified"].boolValue
        )
    }
    
    func makePublication(jsonItem: JSON) -> Plant {
        return Plant(
            _id: jsonItem["_id"].stringValue,
            name: jsonItem["name"].stringValue,
            description: jsonItem["description"].stringValue,
            photo: jsonItem["photo"].stringValue
            
        )
    }
}
