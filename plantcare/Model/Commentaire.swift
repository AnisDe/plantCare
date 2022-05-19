//
//  Commentaire.swift
//  Chicky
//
//  Created by Mac2021 on 15/11/2021.
//

import Foundation

struct Commentaire {
    
    internal init(_id: String? = nil, description: String?, date: Date?, Plant: Plant? = nil, User: User? = nil) {
        self._id = _id
        self.description = description
        self.date = date
        self.Plant = Plant
        self.User = User
    }
    
    
    let _id : String?
    var description : String?
    let date : Date?
    
    // relations
    let Plant : Plant?
    let User : User?
    
}

