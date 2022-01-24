protocol SuperHeroesListPresenterProtocol {
    func refreshSuperHeroes(amount: String)
    func getSuperHeroesDetail(id: String)
    func filter(superHeroes text: String?)

    func attach(view: SuperHeroesListViewProtocol)
}
