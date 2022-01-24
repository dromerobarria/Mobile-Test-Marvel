protocol SuperHeroesRepository {
    func list(amount: String, completionHandler: @escaping (Result<[SuperHeroesModel], ErrorModel>) -> Void)
    func detail(id: String, completionHandler: @escaping (Result<SuperHeroesModel, ErrorModel>) -> Void)
}
