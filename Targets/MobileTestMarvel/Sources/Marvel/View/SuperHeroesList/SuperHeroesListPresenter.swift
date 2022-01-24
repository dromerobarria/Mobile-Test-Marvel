class SuperHeroesListPresenter: SuperHeroesListPresenterProtocol {
    private var view: SuperHeroesListViewProtocol?
    private let superHeroesListUseCase: SuperHeroesListUseCase
    private let detailSuperHeroeUseCase: DetailSuperHeroeUseCase

    private let superHeroesViewModelMapper: Mapper<SuperHeroesViewModel, SuperHeroesModel>
    var superHeroes = [SuperHeroesViewModel]()

    func attach(view: SuperHeroesListViewProtocol) {
        self.view = view
    }

    init(superHeroesListUseCase: SuperHeroesListUseCase, detailSuperHeroeUseCase: DetailSuperHeroeUseCase, superHeroesViewModelMapper: Mapper<SuperHeroesViewModel, SuperHeroesModel>) {
        self.superHeroesListUseCase = superHeroesListUseCase
        self.detailSuperHeroeUseCase = detailSuperHeroeUseCase
        self.superHeroesViewModelMapper = superHeroesViewModelMapper
    }

    func refreshSuperHeroes(amount: String) {
        view?.showLoading(status: true)
        superHeroesListUseCase.fetch(amount: amount) { result in
            self.view?.showLoading(status: false)
            switch result {
            case let .success(superHeroes):
                let viewModels = self.superHeroesViewModelMapper.reverseMap(values: superHeroes)
                SuperHeroesDB.updateSuperHeroes(superHeroesModels: viewModels)
                self.superHeroes = viewModels
                self.view?.show(superHeroes: viewModels)
            case let .failure(error):
                self.superHeroes = SuperHeroesDB.all()
                self.view?.showError(message: error.message, superHeroes: self.superHeroes)
            }
        }
    }

    func filter(superHeroes text: String?) {
        guard
            let text = text?.lowercased().folding(options: .diacriticInsensitive, locale: nil),
            !text.isEmpty
        else {
            view?.show(superHeroes: superHeroes)
            return
        }

        let superHeroesViewModels = superHeroes
        let filteredSuperHeroes = superHeroesViewModels.filter { superHeroe in
            superHeroe.name.lowercased().folding(options: .diacriticInsensitive, locale: nil).contains(text)
        }

        view?.showFilter(superHeroes: filteredSuperHeroes)
    }

    func getSuperHeroesDetail(id: String) {
        view?.showLoading(status: true)
        detailSuperHeroeUseCase.detail(id: id) { result in
            self.view?.showLoading(status: false)
            switch result {
            case let .success(superHeroe):
                let viewModels = self.superHeroesViewModelMapper.reverseMap(value: superHeroe)
                self.view?.showDetail(superHeroes: viewModels)
            case let .failure(error):
                self.view?.showErrorDetail(message: error.message)
            }
        }
    }
}
