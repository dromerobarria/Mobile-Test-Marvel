struct SuperHeroesListUseCase {
    private let superHeroesRepository: SuperHeroesRepository

    init(repository: SuperHeroesRepository) {
        superHeroesRepository = repository
    }

    func fetch(amount: String, completionHandler: @escaping (Result<[SuperHeroesModel], ErrorModel>) -> Void) {
        superHeroesRepository.list(amount: amount) { result in
            completionHandler(result)
        }
    }
}
