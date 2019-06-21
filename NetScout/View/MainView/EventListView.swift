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
                    
                    VStack {
                        
                        
                        Text(event.title)
                        
                        }.frame(height: 175).background(Color.white).cornerRadius(12).padding()
                }
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
