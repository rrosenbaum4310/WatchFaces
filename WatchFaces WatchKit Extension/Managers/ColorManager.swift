//
//  ColorManager.swift
//  WatchFaces WatchKit Extension
//
//  Created by Ryan Rosenbaum on 3/17/22.
//

import Foundation

import SwiftUI

struct ColorManager {
    // create static variables for custom colors

    static let spotifyGreen = Color("SpotifyGreen")
    static let mainBG = Color("MainBG")
    static let lightBlue = Color("LightBlue")
    static let realWhite = Color("RealWhite")
    static let iron = Color("Iron")
    static let pink = Color("Pink")
    static let darkblue = Color("DarkerBlue")
    static let darker = Color("Darker")
    static let lowOpacity = Color("LowerOp")
    static let rectangleColor = Color("RectangleColor")
    static let inverseColor = Color("InverseColor")
    static let DarkYellow = Color("DarkYellow")
    static let Green = Color("Green")
    static let BlueNew = Color("BlueNew")
    static let Red = Color("Red")
    static let DarkBlack = Color("DarkBlack")
    static let ShadowBlack = Color("ShadowBlack")
    static let darkGray = Color("Dark_Gray")

    // ... add the rest of your colors here
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let rColor = (rgbValue & 0xff0000) >> 16
        let gColor = (rgbValue & 0xff00) >> 8
        let bColor = rgbValue & 0xff

        self.init(red: Double(rColor) / 0xff, green: Double(gColor) / 0xff, blue: Double(bColor) / 0xff)
    }
}
