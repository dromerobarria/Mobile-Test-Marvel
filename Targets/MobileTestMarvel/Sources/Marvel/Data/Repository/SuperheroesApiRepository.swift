class SuperHeroesApiRepository: SuperHeroesRepository {
    private let dataSource: SuperHeroesDataSource
    private let superHeroesMapper: Mapper<SuperHeroesModel, SuperHeroesEntity>
    private let errorMapper: Mapper<ErrorModel, ErrorEntity>

    init(
        dataSource: SuperHeroesDataSource,
        superHeroesMapper: Mapper<SuperHeroesModel, SuperHeroesEntity>,
        errorMapper: Mapper<ErrorModel, ErrorEntity>
    ) {
        self.dataSource = dataSource
        self.superHeroesMapper = superHeroesMapper
        self.errorMapper = errorMapper
    }

    func list(amount: String, completionHandler: @escaping (Result<[SuperHeroesModel], ErrorModel>) -> Void) {
        dataSource.list(amount: amount) { result in
            switch result {
            case let .success(countersEntity):
                let model = self.superHeroesMapper.reverseMap(values: countersEntity)
                completionHandler(.success(model))
            case let .failure(errorEntity):
                let error = self.errorMapper.reverseMap(value: errorEntity)
                completionHandler(.failure(error))
            }
        }
    }
}
