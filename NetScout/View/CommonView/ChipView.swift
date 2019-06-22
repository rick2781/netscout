//
//  ChipView.swift
//  NetScout
//
//  Created by Rick Prata on 6/21/19.
//  Copyright © 2019 NetScout. All rights reserved.
//

import SwiftUI

struct ChipView: View {
    
    var color: Color
    var label: String
    
    var body: some View {
        
        VStack {
            Text(label)
                .fontWeight(.regular)
                .padding(.horizontal, 20)
                .padding(.vertical, 4)
                .font(.caption)
            }.background(color).cornerRadius(15)
    }
}

#if DEBUG
struct ChipView_Previews : PreviewProvider {
    static var previews: some View {
        ChipView(color: .red, label: "Tournament")
    }
}
#endif
