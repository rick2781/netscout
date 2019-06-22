//
//  EventListView.swift
//  NetScout
//
//  Created by Rick Prata on 6/21/19.
//  Copyright © 2019 NetScout. All rights reserved.
//

import SwiftUI

struct EventListView: View {
    
    @ObjectBinding var eventStore: EventStore
    
    var body: some View {
        
        ScrollView() {
            
            VStack() {
                
                ForEach(eventStore.eventList.identified(by: \.self)) { event in
                    
                    VStack() {
                        
                        VStack(alignment: .leading, spacing: 20) {
                            
                            HStack {
                                
                                HStack(spacing: 25) {
                                    ChipView(color: .yellow, label: event.eventType.rawValue)
                                    ChipView(color: .green, label: event.gameType.rawValue)
                                }
                                
                                Spacer()
                                
                                Text(event.getMonthDayFormattedStartTime())
                                    .fontWeight(.semibold)
                                    .font(.subheadline)
                                    .opacity(0.5)
                            }
                            
                            Text(event.title)
                                .fontWeight(.medium)
                                .font(.headline)
                                .padding(.leading, 4)
                            
                            HStack {
                                
                                HStack {
                                    Image(systemName: "clock")
                                    
                                    Text(event.getHourMinuteFormattedStartTime())
                                    .fontWeight(.light)
                                    .font(.footnote)
                                    
                                    Spacer()
                                }
                                
                                HStack {
                                    Image(systemName: "location")
                                    
                                    Text(event.getLocationFormatted())
                                        .fontWeight(.light)
                                        .font(.footnote)
                                    
                                    Spacer()
                                }
                            }.padding(.leading, 4)
                            
                            
                            Spacer()
                            }.padding()
                        
                        }.frame(height: 175).background(Color.white).cornerRadius(12).padding()
                }.shadow(radius: 10)
                }.frame(width: UIScreen.main.bounds.width).background(Color.gray)
            
        }
    }
}

#if DEBUG
struct EventListView_Preview : PreviewProvider {
    static var previews: some View {
        EventListView(eventStore: EventStore())
    }
}
#endif
