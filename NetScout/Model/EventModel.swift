//
//  EventModel.swift
//  NetScout
//
//  Created by Rick Prata on 6/19/19.
//  Copyright © 2019 NetScout. All rights reserved.
//

import Foundation

class EventModel: Hashable {
    
    var id = UUID()
    var title: String
    var eventType: EventType
    var startTime: Double
    var endTime: Double?
    var backgroundImage: String?
    var location: Any
    var userAttending: [Any]?
    var cost: Int?
    var skillLevel: SkillLevel?
    var gameType: GameType
    var description: String?
    var organizer: [Any]?
    
    init(title: String,
         eventType: EventType,
         startTime: Double,
         endTime: Double?,
         location: Any,
         userAttending: [Any]?,
         cost: Int?,
         skillLevel: SkillLevel?,
         gameType: GameType,
         description: String?,
         organizer: [Any]?) {
        
        self.title = title
        self.eventType = eventType
        self.startTime = startTime
        self.endTime = endTime
        self.location = location
        self.userAttending = userAttending
        self.cost = cost
        self.skillLevel = skillLevel
        self.gameType = gameType
        self.description = description
        self.organizer = organizer
    }
    
    static func == (lhs: EventModel, rhs: EventModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(cost)
    }
}

enum EventType: String {
    case tournament
    case league
    case dropIn
    case casual
}

enum SkillLevel {
    case green
    case blue
    case orange
    case purple
    case black
}

enum GameType {
    case grass
    case sand
    case indoor
}
