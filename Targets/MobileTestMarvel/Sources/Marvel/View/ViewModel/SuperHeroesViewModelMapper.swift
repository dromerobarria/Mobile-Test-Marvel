import Foundation

class SuperHeroesViewModelMapper: Mapper<SuperHeroesViewModel, SuperHeroesModel> {
    override func reverseMap(value: SuperHeroesModel) -> SuperHeroesViewModel {
        return SuperHeroesViewModel(
            id: value.id,
            name: value.name,
            resultDescription: value.resultDescription,
            thumbnail: value.thumbnail,
            urls: value.urls
        )
    }
}
