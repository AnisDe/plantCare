//
//  suivi.swift
//  plantcare
//
//  Created by Mac-Mini-2021 on 18/05/2022.
//

import Foundation
struct Suivi {
    internal init(_id: String? = nil, name: String? = nil,description: String? = nil, photo: [String]? = nil) {
        self._id = _id
        self.name = name
        self.description = description
        self.photo = photo
}
    let _id : String?
    let name : String?
    let description  : String?
    let photo  : [String]?
   
}
