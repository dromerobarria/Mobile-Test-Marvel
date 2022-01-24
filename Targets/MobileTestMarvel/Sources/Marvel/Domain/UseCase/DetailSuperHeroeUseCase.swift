struct DetailSuperHeroeUseCase {
    private let superHeroesRepository: SuperHeroesRepository

    init(repository: SuperHeroesRepository) {
        superHeroesRepository = repository
    }

    func detail(id: String, completionHandler: @escaping (Result<SuperHeroesModel, ErrorModel>) -> Void) {
        superHeroesRepository.detail(id: id) { result in
            completionHandler(result)
        }
    }
}
