protocol SuperHeroesRepository {
    func list(amount: String, completionHandler: @escaping (Result<[SuperHeroesModel], ErrorModel>) -> Void)
}
