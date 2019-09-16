//
//  ImageCard.swift
//  PrettyCardsTest
//
//  Created by Chris Spradling on 9/8/19.
//  Copyright © 2019 Chris Spradling. All rights reserved.
//

import SwiftUI

struct ImageCard: View {
    var imageName: String
    
    @ObservedObject var colors: ImageColors
    var unified: Bool
    
    init(image: String, unified: Bool) {
        self.imageName = image
        self.colors = ImageColors(UIImage(named: image)!)
        self.unified = unified
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            image
                .conditionalModifier(!unified, ImageRounder(shadow: colors.primary))
            
            TitleStack(titleColor: colors.secondary, subtitleColor: colors.detail, topEdge: unified ? 24 : 12)
                .conditionalModifier(!unified, Rounder(background: colors.background, shadow: colors.primary))
            
        }
        .conditionalModifier(unified, Rounder(background: colors.background, shadow: colors.primary))
        .padding(.bottom, 24)
            
    }
    
    var image: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(4/3, contentMode: .fit)
    }

}

struct ImageRounder: ViewModifier {
    var shadow: Color
    var cornerRadius: CGFloat = 24
    
    func body(content: Content) -> some View {
        return content
            .cornerRadius(cornerRadius)
            .shadow(color: shadow, radius: 6, x: 8, y: 8)
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 12, trailing: 0))

    }
    
}

struct Rounder: ViewModifier {
    var background: Color
    var shadow: Color
    var cornerRadius: CGFloat = 24
    
    func body(content: Content) -> some View {
        return content
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
            .background(background)
            .cornerRadius(cornerRadius)
            .shadow(color: shadow, radius: 6, x: 8, y: 8)

    }
}

extension View {
    // If condition is met, apply modifier, otherwise, leave the view untouched
    public func conditionalModifier<T>(_ condition: Bool, _ modifier: T) -> some View where T: ViewModifier {
        Group {
            if condition {
                self.modifier(modifier)
            } else {
                self
            }
        }
    }
}
