//
//  TitleStack.swift
//  PrettyCardsTest
//
//  Created by Chris Spradling on 9/8/19.
//  Copyright © 2019 Chris Spradling. All rights reserved.
//

import SwiftUI

struct TitleStack: View {
    
    var titleColor: Color
    var subtitleColor: Color
    var topEdge: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Title goes here")
                .foregroundColor(titleColor)
                .font(.headline)
                .padding(EdgeInsets(top: topEdge, leading: 12, bottom: 2, trailing: 12))
            
            Text("Subtitle here, and it's going to be a really long subtitle with lots of description; the plan, you see, is to force this block of text to take up a couple or maybe even three lines")
                .foregroundColor(subtitleColor)
                .font(.caption)
                .padding(EdgeInsets(top: 4, leading: 12, bottom: 12, trailing: 12))
            
        }
        
    }
    
}
