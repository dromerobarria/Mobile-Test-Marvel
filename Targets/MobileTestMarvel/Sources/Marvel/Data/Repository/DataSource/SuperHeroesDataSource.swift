protocol SuperHeroesDataSource {
    func list(amount: String, completionHandler: @escaping (Result<[SuperHeroesEntity], ErrorEntity>) -> Void)
    func detail(id: String, completionHandler: @escaping (Result<SuperHeroesEntity, ErrorEntity>) -> Void)
}
