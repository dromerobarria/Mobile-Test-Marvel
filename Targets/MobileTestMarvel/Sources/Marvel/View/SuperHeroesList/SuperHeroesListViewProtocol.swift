protocol SuperHeroesListViewProtocol: AnyObject {
    func showLoading(status: Bool)
    func show(superHeroes: [SuperHeroesViewModel])
    func showFilter(superHeroes: [SuperHeroesViewModel])
    func showError(message: String)
    var superHeroesListViewModel: [SuperHeroesViewModel] { get }
}
