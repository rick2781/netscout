//
//  WeekStore.swift
//  NetScout
//
//  Created by Rick Prata on 6/19/19.
//  Copyright © 2019 NetScout. All rights reserved.
//

import Combine
import SwiftUI

class WeekStore : BindableObject {
    
    var weekDayList: [WeekDateModel] {
        didSet { didChange.send() }
    }
    
    var selectedDay: WeekDateModel = WeekDateModel(dayNumber: -1, weekDayLetter: "Z", monthName: "Z")
    
    var didChange = PassthroughSubject<Void, Never>()
    
    init() {
        
        var dateComponentItem = DateComponents()
        
        weekDayList = []
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        
        //The ending value should NOT be bigger than 28 because of the current logic in selectDay function in ScrollableWeekView
        for item in 0...27 {
            
            dateComponentItem.day = item
            
            if let currentItem = Calendar.current.date(byAdding: dateComponentItem, to: Date()) {
                
                self.weekDayList.append(WeekDateModel(
                    dayNumber: Calendar.current.component(.day, from: currentItem),
                    weekDayLetter: getWeekDay(dayOfWeekNumber: Calendar.current.component(.weekday, from: currentItem)),
                    monthName: dateFormatter.string(from: currentItem)))
            }
        }
        
        selectDay(number: weekDayList[0].dayNumber)
    }
    
    func selectDay(number: Int) {
        
        // Go over weekDayList and unselect previously selected day
        for weekDay in self.weekDayList {
            
            if weekDay.isSelected {
                
                if let weekDayIndex = self.weekDayList.firstIndex(of: weekDay) {
                    
                    let newValue = WeekDateModel(
                        dayNumber: weekDay.dayNumber,
                        weekDayLetter: weekDay.weekDayLetter,
                        monthName: weekDay.monthName,
                        isSelected: false)
                    
                    self.weekDayList[weekDayIndex] = newValue
                }
            }
        }
        
        self.weekDayList[self.weekDayList.firstIndex(where: {$0.dayNumber == number})!].isSelected = true
        
        // Logic that selects the day
        if let weekDayIndex = self.weekDayList.firstIndex(where: {$0.dayNumber == number}) {
            
            let weekDay = self.weekDayList[weekDayIndex]
            
            let newValue = WeekDateModel(
                dayNumber: weekDay.dayNumber,
                weekDayLetter: weekDay.weekDayLetter,
                monthName: weekDay.monthName,
                isSelected: true)
            
            self.weekDayList[weekDayIndex] = newValue
            
            selectedDay = newValue
            didChange.send()
        }
    }
    
    private func getWeekDay(dayOfWeekNumber: Int) -> String {
        switch dayOfWeekNumber {
        case 1:
            return "S"
        case 2:
            return "M"
        case 3:
            return "T"
        case 4:
            return "W"
        case 5:
            return "T"
        case 6:
            return "F"
        case 7:
            return "S"
        default:
            return "S"
        }
    }
}
