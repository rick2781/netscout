//
//  EventModel.swift
//  NetScout
//
//  Created by Rick Prata on 6/19/19.
//  Copyright © 2019 NetScout. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation
import Contacts

class EventModel: Hashable {
    
    var id = UUID()
    var title: String
    var startTime: Double
    var endTime: Double?
    var backgroundImage: String?
    var userAttending: [UserModel]
    var organizer: [UserModel]
    var cost: String?
    var skillLevel: [SkillLevel]?
    var gameType: GameType
    var eventType: EventType
    var description: String?
    var longitude: Double
    var latitude: Double
    
    init(title: String,
         eventType: EventType,
         startTime: Double,
         endTime: Double?,
         userAttending: [UserModel],
         cost: String?,
         skillLevel: [SkillLevel]?,
         gameType: GameType,
         description: String?,
         organizer: [UserModel],
         longitude: Double,
         latitude: Double) {
        
        self.title = title
        self.eventType = eventType
        self.startTime = startTime
        self.endTime = endTime
        self.userAttending = userAttending
        self.cost = cost
        self.skillLevel = skillLevel
        self.gameType = gameType
        self.description = description
        self.organizer = organizer
        self.latitude = latitude
        self.longitude = longitude
    }
    
    static func == (lhs: EventModel, rhs: EventModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(cost)
    }
    
    func getMonthDayFormattedStartTime() -> String {
        
        let date = Date(timeIntervalSince1970: (startTime / 1000.0))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd"
        
        return dateFormatter.string(from: date)
    }
    
    func getHourMinuteFormattedStartTime() -> String {
        
        let date = Date(timeIntervalSince1970: (startTime / 1000.0))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        return dateFormatter.string(from: date)
    }
    
    func getLocationFormatted() -> String? {
        
        var result: String?
        
        let geocoder = CLGeocoder()
        let locationCoordinate = CLLocation(latitude: self.latitude, longitude: self.longitude)
        
        geocoder.reverseGeocodeLocation(locationCoordinate) { (placemarks, error) in
            
            if let placemark = placemarks?[0], error != nil {
                result = placemark.areasOfInterest?[0] ?? placemark.name
            }
        }
        
        return result
    }
}

enum EventType: String {
    case tournament = "Tournament"
    case league = "League"
    case dropIn = "Drop-in"
    case casual = "Casual"
}

enum SkillLevel {
    case green
    case blue
    case orange
    case purple
    case black
}

enum GameType: String {
    case grass = "Grass"
    case sand = "Sand"
    case indoor = "Indoor"
}
