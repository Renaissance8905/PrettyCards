//
//  ImageColors.swift
//  PrettyCardsTest
//
//  Created by Chris Spradling on 9/8/19.
//  Copyright © 2019 Chris Spradling. All rights reserved.
//

import Combine
import SwiftUI

class ImageColors: ObservableObject, Identifiable {
    private let image: UIImage
    let willChange = PassthroughSubject<Void, Never>()
    
    var background: Color = .black
    var primary: Color = .black
    var secondary: Color = .black
    var detail: Color = .black
    
    init(_ image: UIImage) {
        self.image = image
        getColors()
    }
    
    func getColors() {
        let colors = image.getColors(quality: .high)
        background = Color(colors.background)
        primary = Color(colors.primary)
        secondary = Color(colors.secondary)
        detail = Color(colors.detail)
        willChange.send()
    }
}
