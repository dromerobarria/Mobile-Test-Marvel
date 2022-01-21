import Foundation

struct SuperHeroesEntity: Codable {
    let id: Int
    let name: String
    let resultDescription: String
    let thumbnail: Thumbnail
    let urls: [URLElement]

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case thumbnail
        case resultDescription = "description"
        case urls
    }
}

struct Thumbnail: Codable {
    let path: String
}

struct URLElement: Codable {
    let type: URLType
    let url: String
}

enum URLType: String, Codable {
    case comiclink
    case detail
    case wiki
}
