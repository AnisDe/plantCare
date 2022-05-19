//
//  User.swift
//  plantcare
//
//  Created by Mac-Mini-2021 on 16/4/2022.
//

import Foundation
struct User {
    internal init(_id: String? = nil, name: String? = nil, email: String? = nil, phone: String? = nil, password: String? = nil, isVerified: Bool? = nil) {
        self._id = _id
        self.name = name
        self.email = email
        self.phone = phone
        self.password = password
        self.isVerified = isVerified
        
    }
    
    
    var _id : String?
    var name : String?
    var email : String?
    var phone  : String?
    var password : String?
    var isVerified : Bool?
   
}
