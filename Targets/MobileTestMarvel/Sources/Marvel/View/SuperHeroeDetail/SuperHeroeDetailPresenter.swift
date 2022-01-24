class SuperHeroeDetailPresenter: SuperHeroeDetailPresenterProtocol {
    private var view: SuperHeroeDetailViewProtocol?

    func attach(view: SuperHeroeDetailViewProtocol) {
        self.view = view
    }

    init() {}
}
