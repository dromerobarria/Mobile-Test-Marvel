class SuperHeroesListPresenter: SuperHeroesListPresenterProtocol {
    private var view: SuperHeroesListViewProtocol?

    func attach(view: SuperHeroesListViewProtocol) {
        self.view = view
    }

    // swiftlint:disable:next line_length
    init() {}
}
