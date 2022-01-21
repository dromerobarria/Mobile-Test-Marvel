struct SuperHeroesModel {
    let id: Int
    let name: String
    let resultDescription: String
    let thumbnail: Thumbnail
    let urls: [URLElement]

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case resultDescription = "description"
        case urls
    }
}
