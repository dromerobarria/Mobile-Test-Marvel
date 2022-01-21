import UIKit

struct SuperHeroesViewModel: Equatable {
    let id: Int
    let name: String
    let resultDescription: String
    let thumbnail: Thumbnail
    let urls: [URLElement]

    static func == (lhs: SuperHeroesViewModel, rhs: SuperHeroesViewModel) -> Bool {
        if lhs.id == rhs.id {
            return true
        } else {
            return false
        }
    }
}
