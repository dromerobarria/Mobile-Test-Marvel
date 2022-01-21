import Foundation

class SuperHeroesServiceLocator {
    private let networkServiceLocator = NetworkServiceLocator()

    private var codableHelper: CodableHelper {
        return CodableHelper()
    }

    private var domainNetwork: DomainNetworkBase<Endpoint.Marvel> {
        return MarvelNetwork()
    }

    private var marvelRestApi: MarvelRestApi {
        return MarvelNetworkRestApi(domainNetwork: domainNetwork,
                                    session: networkServiceLocator.session,
                                    codableHelper: codableHelper)
    }

    private var counterDataSource: SuperHeroesDataSource {
        return SuperHeroesApiDataSource(restApi: marvelRestApi)
    }

    private var superHeroesRepository: SuperHeroesRepository {
        return SuperHeroesApiRepository(dataSource: counterDataSource,
                                        superHeroesMapper: superHeroesModelToEntityMapper,
                                        errorMapper: errorModelToEntityMapper)
    }

    private var superHeroesModelToEntityMapper: Mapper<SuperHeroesModel, SuperHeroesEntity> {
        return SuperHeroesModelToEntityMapper()
    }

    private var errorModelToEntityMapper: Mapper<ErrorModel, ErrorEntity> {
        return ErrorModelToEntityMapper()
    }

    var superHeroesListUseCase: SuperHeroesListUseCase {
        return SuperHeroesListUseCase(repository: superHeroesRepository)
    }

    var superHeroesViewModelMapper: Mapper<SuperHeroesViewModel, SuperHeroesModel> {
        return SuperHeroesViewModelMapper()
    }
}
