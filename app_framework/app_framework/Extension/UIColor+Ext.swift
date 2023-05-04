//
//  UIColor+Ext.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0

        var rgbValue: UInt64 = 0

        scanner.scanHexInt64(&rgbValue)

        let r = (rgbValue & 0xFF0000) >> 16
        let g = (rgbValue & 0xFF00) >> 8
        let b = rgbValue & 0xFF

        self.init(
            red: CGFloat(r) / 0xFF,
            green: CGFloat(g) / 0xFF,
            blue: CGFloat(b) / 0xFF, alpha: 1
        )
    }

    class var blackText: UIColor {
        return UIColor(hex: "333333")
    }

    class var blueFb: UIColor {
        return UIColor(hex: "005DA6")
    }

    class var blueAlfa: UIColor {
        return UIColor(hex: "005DA6")
    }

    class var white2: UIColor {
        return UIColor(hex: "F9F9F9")
    }

    class var alfaDarkRed: UIColor {
        return UIColor(hex: "9C0F0F")
    }

    class var alfaRed: UIColor {
        return UIColor(hex: "D00B0B")
    }

    class var strikeGrayColor: UIColor {
        return UIColor(hex: "CCCCCC")
    }

    class var realPriceColor: UIColor {
        return UIColor(hex: "D00B0B")
    }

    class var separatorColor: UIColor {
        return UIColor(hex: "DBDBDB")
    }

    class var sectionTextColor: UIColor {
        return UIColor(hex: "999999")
    }

    class var storeProductBackgroundColor: UIColor {
        return UIColor(hex: "F9F9F9")
    }

    class var newTagColor: UIColor {
        return UIColor(hex: "FFD301")
    }

    class var discountTagColors: (start: UIColor, end: UIColor) {
        return (UIColor(hex: "E9382D"), UIColor(hex: "F56D5F"))
    }

    class var favoriteTagColors: (start: UIColor, end: UIColor) {
        return (UIColor(hex: "00AF99"), UIColor(hex: "06C2A9"))
    }

    class var gradientButtonColors: (start: UIColor, end: UIColor) {
        return (UIColor(hex: "005DA6"), UIColor(hex: "4892D3"))
    }
}
