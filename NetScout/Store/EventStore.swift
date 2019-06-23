//
//  EventStore.swift
//  NetScout
//
//  Created by Rick Prata on 6/21/19.
//  Copyright © 2019 NetScout. All rights reserved.
//

import Combine
import SwiftUI

class EventStore : BindableObject {
    
    var eventList: [EventModel] {
        didSet { didChange.send() }
    }
    
    var didChange = PassthroughSubject<Void, Never>()
    
    init() {
        
        eventList = []
        
        let user = UserModel(id: UUID().uuidString, displayName: "Rick Prata", email: "testrick@gmail.com", phoneNumber: "1254845612", profilePic: "https://www.w3schools.com/howto/img_snow.jpg")
        
        let event = EventModel(title: "Dive Volleyball Drop-In Test", eventType: .dropIn, startTime: NSDate().timeIntervalSince1970, endTime: nil, userAttending: [user, user], cost: "100", skillLevel: [.black, .purple], gameType: .indoor, description: nil, organizer: [user], longitude: -104.983345, latitude: 39.746160)
        
        let event2 = EventModel(title: "MOTR Volleyball League", eventType: .league, startTime: NSDate().timeIntervalSince1970, endTime: nil, userAttending: [user, user], cost: nil, skillLevel: [.black, .purple], gameType: .indoor, description: nil, organizer: [user], longitude: -104.983345, latitude: 39.746160)
        
        eventList.append(event)
        eventList.append(event2)
        eventList.append(event2)
        eventList.append(event)
        eventList.append(event)
        eventList.append(event2)
        eventList.append(event2)
        eventList.append(event)
        eventList.append(event)
        eventList.append(event)
        eventList.append(event)
        eventList.append(event2)
        eventList.append(event)
        eventList.append(event2)
        eventList.append(event)
        eventList.append(event)
        eventList.append(event)
        eventList.append(event)
        eventList.append(event)
        eventList.append(event)
        eventList.append(event)
        eventList.append(event)
        eventList.append(event)
        eventList.append(event)
        eventList.append(event)
        eventList.append(event)
        eventList.append(event)
        eventList.append(event)
        eventList.append(event)
        eventList.append(event)
        eventList.append(event)
        eventList.append(event)
        eventList.append(event)
        eventList.append(event)
        eventList.append(event)
        eventList.append(event)
        eventList.append(event)
    }
}
