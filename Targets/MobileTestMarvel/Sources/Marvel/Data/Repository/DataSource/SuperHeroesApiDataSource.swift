class SuperHeroesApiDataSource: SuperHeroesDataSource {
    private let marvelRestApi: MarvelRestApi

    init(restApi: MarvelRestApi) {
        marvelRestApi = restApi
    }

    func list(amount: String, completionHandler: @escaping (Result<[SuperHeroesEntity], ErrorEntity>) -> Void) {
        marvelRestApi.list(amount: amount) { result in
            completionHandler(result)
        }
    }
}
