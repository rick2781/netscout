//
//  ScrollableWeekView.swift
//  NetScout
//
//  Created by Rick Prata on 6/19/19.
//  Copyright © 2019 NetScout. All rights reserved.
//

import SwiftUI

struct ScrollableWeekView: View {
    
    @ObjectBinding var store: WeekStore
    
    var body: some View {
        
        ScrollView(showsHorizontalIndicator: false) {
            
            HStack {
                ForEach(store.weekDayList.identified(by: \.self)) { weekData in
                    
                    Button(action: {
                        
                        self.store.selectDay(number: weekData.dayNumber)
                        
                    }) {
                        VStack {
                            Text(weekData.weekDayLetter).foregroundColor(.secondary)
                            
                            if weekData.isSelected {
                                Text(String(weekData.dayNumber as Int)).background(Image(systemName: "circle.fill").imageScale(.large
                                    ).foregroundColor(.red))
                            } else {
                                Text(String(weekData.dayNumber as Int))
                            }
                            
                            }.foregroundColor(.black).onDisappear(perform: {
                                print(weekData.dayNumber)
                            })
                        
                        }.padding()
                }
            }
            }.frame(height: 80)
    }
}
