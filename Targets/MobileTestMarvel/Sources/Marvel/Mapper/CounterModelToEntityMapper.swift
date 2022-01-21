import Foundation

class SuperHeroesModelToEntityMapper: Mapper<SuperHeroesModel, SuperHeroesEntity> {
    override func reverseMap(value: SuperHeroesEntity) -> SuperHeroesModel {
        return SuperHeroesModel(id: value.id,
                                name: value.name,
                                resultDescription: value.resultDescription,
                                thumbnail: value.thumbnail,
                                urls: value.urls)
    }
}
