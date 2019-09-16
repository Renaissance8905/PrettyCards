//
//  UIImage+AverageColor.swift
//  PrettyCardsTest
//
//  Created by Chris Spradling on 9/8/19.
//  Copyright © 2019 Chris Spradling. All rights reserved.
//

import SwiftUI
import UIKit

extension UIImage {
    
    var averageColor: Color? {
        return thumbnail.getAverageColor()
    }
    
    private func getAverageColor() -> Color? {
        guard let inputImage = CIImage(image: self) else { return nil }
        let extentVector = CIVector(x: inputImage.extent.origin.x, y: inputImage.extent.origin.y, z: inputImage.extent.size.width, w: inputImage.extent.size.height)

        guard let filter = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: extentVector]) else { return nil }
        guard let outputImage = filter.outputImage else { return nil }

        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: [.workingColorSpace: kCFNull!])
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBA8, colorSpace: nil)

        return Color(red: Double(bitmap[0]) / 255, green: Double(bitmap[1]) / 255, blue: Double(bitmap[2]) / 255, opacity: Double(bitmap[3]) / 255)
    }
    
    var thumbnail: UIImage {
        let thumbnailSize = CGSize(width: 100, height: 100)
        let format = UIGraphicsImageRendererFormat()
        format.scale = 1
        format.preferredRange = .standard
        let renderer = UIGraphicsImageRenderer(size: thumbnailSize, format: format)
        let result = renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
        return result
    }
}
