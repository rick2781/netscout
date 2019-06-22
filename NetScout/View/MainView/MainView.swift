//
//  ContentView.swift
//  NetScout
//
//  Created by Rick Prata on 6/19/19.
//  Copyright © 2019 NetScout. All rights reserved.
//

import SwiftUI

struct MainView : View {
    
    @ObjectBinding var weekStore = WeekStore()
    @ObjectBinding var eventStore = EventStore()
    
    var body: some View {
        
        VStack {
            
            HStack() {
                
                Text(weekStore.selectedDay.monthName)
                    .font(.title)
                    .bold()
                
                Spacer()
                
                HStack {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                            .padding(10)
                            .imageScale(.large)
                    }
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "line.horizontal.3.decrease")
                            .foregroundColor(.black)
                            .padding(10)
                            .imageScale(.large)
                    }
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "calendar")
                            .foregroundColor(.black)
                            .padding(10)
                            .imageScale(.large)
                    }
                }
                
                }.padding()
            
            ScrollableWeekView(store: weekStore)
            
            Divider()
            
            EventListView(eventStore: eventStore)
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
#endif
