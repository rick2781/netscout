//
//  UserModel.swift
//  NetScout
//
//  Created by Rick Prata on 6/20/19.
//  Copyright © 2019 NetScout. All rights reserved.
//

import Foundation

class UserModel: Hashable {
    
    var id: String
    var displayName: String
    var email: String
    var phoneNumber: String
    var profilePic: String
    
    init(id: String,
         displayName: String,
         email: String,
         phoneNumber: String,
         profilePic: String) {
        
        self.id = id
        self.displayName = displayName
        self.email = email
        self.phoneNumber = phoneNumber
        self.profilePic = profilePic
    }
    
    static func == (lhs: UserModel, rhs: UserModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(displayName)
        hasher.combine(email)
        hasher.combine(phoneNumber)
        hasher.combine(profilePic)
    }
}
