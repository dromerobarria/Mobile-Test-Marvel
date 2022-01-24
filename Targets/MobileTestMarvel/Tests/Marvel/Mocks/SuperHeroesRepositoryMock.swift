@testable import MobileTestMarvel

class SuperHeroesRepositoryMock: SuperHeroesRepository {
    var listSuccess = true
    var detailSuccess = true

    func list(amount _: String, completionHandler: @escaping (Result<[SuperHeroesModel], ErrorModel>) -> Void) {
        if listSuccess {
            completionHandler(.success(dummyList()))
        } else {
            completionHandler(.failure(generateErrorModel()))
        }
    }

    func detail(id _: String, completionHandler: @escaping (Result<SuperHeroesModel, ErrorModel>) -> Void) {
        if detailSuccess {
            completionHandler(.success(dummy()))
        } else {
            completionHandler(.failure(generateErrorModel()))
        }
    }

    private func dummy() -> SuperHeroesModel {
        SuperHeroesModel(id: 1, name: "name.1", resultDescription: "resultDescription", thumbnail: Thumbnail(path: "path"), urls: [])
    }

    private func dummyList() -> [SuperHeroesModel] {
        return [
            SuperHeroesModel(id: 1, name: "name.1", resultDescription: "resultDescription", thumbnail: Thumbnail(path: "path"), urls: []),
            SuperHeroesModel(id: 2, name: "name.2", resultDescription: "resultDescription", thumbnail: Thumbnail(path: "path"), urls: []),
            SuperHeroesModel(id: 3, name: "name.3", resultDescription: "resultDescription", thumbnail: Thumbnail(path: "path"), urls: []),
        ]
    }

    private func generateErrorModel() -> ErrorModel {
        return ErrorModel(
            error: nil,
            exception: nil,
            message: "Error unexpected",
            path: nil,
            status: 400,
            timestamp: nil
        )
    }
}
