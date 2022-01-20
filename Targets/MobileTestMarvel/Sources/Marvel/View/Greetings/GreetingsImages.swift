import UIKit

class GreetingsImages {
    class Icons {
        class var iconHulk: UIImage {
            return icon(named: "icon-hulk")
        }

        class var iconAmerica: UIImage {
            return icon(named: "icon-america")
        }

        class var iconIronMan: UIImage {
            return icon(named: "icon-ironMan")
        }
    }

    static func icon(named: String) -> UIImage {
        if let image = UIImage(named: named) {
            return image
        }
        return UIImage()
    }
}
