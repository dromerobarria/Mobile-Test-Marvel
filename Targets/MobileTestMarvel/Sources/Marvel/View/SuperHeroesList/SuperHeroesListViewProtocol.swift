protocol SuperHeroesListViewProtocol: AnyObject {
    func showLoading(status: Bool)
    func show(superHeroes: [SuperHeroesViewModel])
    func showDetail(superHeroes: SuperHeroesViewModel)
    func showFilter(superHeroes: [SuperHeroesViewModel])
    func showError(message: String, superHeroes: [SuperHeroesViewModel])
    func showErrorDetail(message: String)
    var superHeroesListViewModel: [SuperHeroesViewModel] { get }
}
