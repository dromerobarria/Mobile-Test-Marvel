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

    private var superHeroesDataSource: SuperHeroesDataSource {
        return SuperHeroesApiDataSource(restApi: marvelRestApi)
    }

    private var superHeroesRepository: SuperHeroesRepository {
        return SuperHeroesApiRepository(dataSource: superHeroesDataSource,
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

    var detailSuperHeroeUseCase: DetailSuperHeroeUseCase {
        return DetailSuperHeroeUseCase(repository: superHeroesRepository)
    }

    var superHeroesViewModelMapper: Mapper<SuperHeroesViewModel, SuperHeroesModel> {
        return SuperHeroesViewModelMapper()
    }
}
