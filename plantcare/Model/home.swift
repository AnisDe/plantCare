//
//  home.swift
//  plantcare
//
//  Created by Apple Esprit on 23/4/2022.
//

import Foundation
struct Home {
    internal init(_id: String? = nil, name: String? = nil,description: String? = nil, photo: String? = nil) {
        self._id = _id
        self.name = name
        self.description = description
        self.photo = photo
}
    let _id : String?
    let name : String?
    let description  : String?
    let photo  : String?
   
}

