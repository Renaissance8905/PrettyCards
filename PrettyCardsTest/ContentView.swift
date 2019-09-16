//
//  ContentView.swift
//  PrettyCardsTest
//
//  Created by Chris Spradling on 9/8/19.
//  Copyright © 2019 Chris Spradling. All rights reserved.
//

import Combine
import SwiftUI


struct ContentView: View {
    @State private var unified: Bool = false
    
    var images = [
        "img1",
        "img2",
        "img3",
        "img4"
    ]
    var body: some View {
        VStack {
            Button(action: {
                withAnimation(.linear(duration: 2.0)) {
                    self.unified.toggle()
                }
            }) {
                Text("Unified Cards")
            }.padding(EdgeInsets(top: 20, leading: 20, bottom: 10, trailing: 20))
            
            List {
                ForEach(images, id: \.self) {
                    ImageCard(image: $0, unified: self.unified)
                }
            }
        }
    }
    
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
