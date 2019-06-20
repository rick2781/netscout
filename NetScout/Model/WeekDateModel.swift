//
//  WeekDateModel.swift
//  NetScout
//
//  Created by Rick Prata on 6/19/19.
//  Copyright © 2019 NetScout. All rights reserved.
//

class WeekDateModel: Hashable {
    
    var dayNumber: Int
    var weekDayLetter: String
    var monthName: String
    var isSelected: Bool
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(dayNumber)
        hasher.combine(weekDayLetter)
    }
    
    init(dayNumber: Int, weekDayLetter: String, monthName: String, isSelected: Bool = false) {
        self.dayNumber = dayNumber
        self.weekDayLetter = weekDayLetter
        self.monthName = monthName
        self.isSelected = isSelected
    }
    
    static func == (lhs: WeekDateModel, rhs: WeekDateModel) -> Bool {
        return lhs.dayNumber == rhs.dayNumber && lhs.weekDayLetter == lhs.weekDayLetter
    }
}
