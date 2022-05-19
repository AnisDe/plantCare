

import Foundation
struct Plant {
    internal init(_id: String?=nil, name: String?=nil, description: String?=nil ,photo: String?=nil){
        self._id = _id
        self.photo = photo
        self.name = name
        self.description = description

        
    }
    
    
    let _id : String?
    let photo : String?
    let name : String?
    let description : String?

  
  
    
    
}
