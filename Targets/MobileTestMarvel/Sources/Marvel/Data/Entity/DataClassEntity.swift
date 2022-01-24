struct DataClassEntity: Codable {
    let offset, limit, total, count: Int
    let results: [SuperHeroesEntity]
}
