import UIKit

class SuperHeroeCellImages {
    class Icons {
        class var superHeroeMarvel: UIImage {
            return icon(named: "icon-superHeroeMarvel")
        }
    }

    static func icon(named: String) -> UIImage {
        if let image = UIImage(named: named) {
            return image
        }
        return UIImage()
    }
}
