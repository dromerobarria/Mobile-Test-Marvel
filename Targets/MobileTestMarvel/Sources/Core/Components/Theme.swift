import UIKit

struct Theme {
    let primaryBackground: UIColor
    let primarySolid: UIColor
    let primaryDark: UIColor
    let primaryMedium: UIColor
    let primaryLight: UIColor
    let secondarySolid: UIColor

    static var current = Theme.originalTheme

    static let originalTheme = Theme(primaryBackground: Colors.white,
                                     primarySolid: Colors.black,
                                     primaryDark: Colors.darkGray,
                                     primaryMedium: Colors.gray,
                                     primaryLight: Colors.lightGray,
                                     secondarySolid: Colors.yellow)
}

private enum Colors {
    static let yellow = #colorLiteral(red: 1, green: 0.5843137255, blue: 0, alpha: 1) // UIColor(hex: "#FF9500")
    static let white = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) // UIColor(hex: "#FFFFFF")
    static let black = #colorLiteral(red: 0.01960784314, green: 0.01960784314, blue: 0.1529411765, alpha: 1) // UIColor(hex: "#050527")
    static let darkGray = #colorLiteral(red: 0.1411764706, green: 0.1725490196, blue: 0.2117647059, alpha: 1) // UIColor(hex: "#242C36")
    static let gray = #colorLiteral(red: 0.4745098039, green: 0.4745098039, blue: 0.4745098039, alpha: 1) // UIColor(hex: "#797979")
    static let red = #colorLiteral(red: 1, green: 0.231372549, blue: 0.1882352941, alpha: 1) // UIColor(hex: "#FF0000")
    static let lightGray = #colorLiteral(red: 0.9293302894, green: 0.929463923, blue: 0.9293010831, alpha: 1)
}
