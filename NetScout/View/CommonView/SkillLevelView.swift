//
//  SkillLevelView.swift
//  NetScout
//
//  Created by Rick Prata on 6/23/19.
//  Copyright © 2019 NetScout. All rights reserved.
//

import SwiftUI

struct SkillLevelView : View {
    
    let skillLevelList: [SkillLevel]
    
    var body: some View {
        
        Image(systemName: "flame")
        
        ForEach(skillLevelList.identified(by: \.self)) { skillLevel in
            
            switch skillLevel {
                
            case .green: {
                Image(systemName: "circle.fill")
                    .foregroundColor(.green)
                }
                
            case .blue: {
                Image(systemName: "circle.fill")
                    .foregroundColor(.blue)
                }
                
            case .orange: {
                Image(systemName: "circle.fill")
                    .foregroundColor(.orange)
                }
                
            case .purple: {
                Image(systemName: "circle.fill")
                    .foregroundColor(.purple)
                }
                
            case .black: {
                Image(systemName: "circle.fill")
                    .foregroundColor(.black)
                }
            }
        }
    }
}

#if DEBUG
struct SkillLevelView_Previews : PreviewProvider {
    static var previews: some View {
        SkillLevelView()
    }
}
#endif
