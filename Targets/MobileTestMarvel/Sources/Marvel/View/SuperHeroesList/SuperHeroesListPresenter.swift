class SuperHeroesListPresenter: SuperHeroesListPresenterProtocol {
    private var view: SuperHeroesListViewProtocol?
    private let superHeroesListUseCase: SuperHeroesListUseCase

    private let superHeroesViewModelMapper: Mapper<SuperHeroesViewModel, SuperHeroesModel>
    var superHeroes = [SuperHeroesViewModel]()

    func attach(view: SuperHeroesListViewProtocol) {
        self.view = view
    }

    init(superHeroesListUseCase: SuperHeroesListUseCase, superHeroesViewModelMapper: Mapper<SuperHeroesViewModel, SuperHeroesModel>) {
        self.superHeroesListUseCase = superHeroesListUseCase
        self.superHeroesViewModelMapper = superHeroesViewModelMapper
    }

    func refreshSuperHeroes(amount: String) {
        view?.showLoading(status: true)
        superHeroesListUseCase.fetch(amount: amount) { result in
            self.view?.showLoading(status: false)
            switch result {
            case let .success(superHeroes):
                let viewModels = self.superHeroesViewModelMapper.reverseMap(values: superHeroes)
                self.superHeroes = viewModels
                self.view?.show(superHeroes: viewModels)
            case let .failure(error):
                self.view?.showError(message: error.message)
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
}
