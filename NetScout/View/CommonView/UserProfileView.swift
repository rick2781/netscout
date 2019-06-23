//
//  UserProfileView.swift
//  NetScout
//
//  Created by Rick Prata on 6/22/19.
//  Copyright © 2019 NetScout. All rights reserved.
//

import SwiftUI

struct UserProfileView : View {
    
    var userProfileList: [UserModel]
    
    var body: some View {
        
        HStack() {
            
            ForEach(userProfileList.identified(by: \.self)) { user in
                
                // Wait until this bug gets fixed - Ambiguous reference to member
//                if userProfileList.firstIndex(of: user) != 4 {
                    
                    URLImage(URL(string: user.profilePic!)!)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .aspectRatio(CGSize(width: 30, height: 30), contentMode: .fit)
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(Color.white, lineWidth: 2))
                        .padding(-6)
                    
//                } else {
//
//                    Text(userProfileList.count)
//                }
            }
        }
    }
}

#if DEBUG
struct UserProfileView_Previews : PreviewProvider {
    static var previews: some View {
        UserProfileView(userProfileList: [UserModel(id: UUID().uuidString, displayName: "Rick Prata", email: "testrick@gmail.com", phoneNumber: "1254845612", profilePic: "https://www.w3schools.com/howto/img_snow.jpg"), UserModel(id: UUID().uuidString, displayName: "Rick Prata", email: "testrick@gmail.com", phoneNumber: "1254845612", profilePic: "https://www.w3schools.com/howto/img_snow.jpg"),UserModel(id: UUID().uuidString, displayName: "Rick Prata", email: "testrick@gmail.com", phoneNumber: "1254845612", profilePic: "https://www.w3schools.com/howto/img_snow.jpg"),UserModel(id: UUID().uuidString, displayName: "Rick Prata", email: "testrick@gmail.com", phoneNumber: "1254845612", profilePic: "https://www.w3schools.com/howto/img_snow.jpg")])
    }
}
#endif
