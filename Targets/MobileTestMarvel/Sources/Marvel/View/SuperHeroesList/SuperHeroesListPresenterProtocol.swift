protocol SuperHeroesListPresenterProtocol {
    func refreshSuperHeroes(amount: String)
    func filter(superHeroes text: String?)

    func attach(view: SuperHeroesListViewProtocol)
}
