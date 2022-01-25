@testable import MobileTestMarvel
import XCTest

class SuperHeroesRestApiMock: MarvelRestApi {
    var listSuccess = true
    var detailSuccess = true

    func list(amount _: String, completionHandler: @escaping (Result<[SuperHeroesEntity], ErrorEntity>) -> Void) {
        if listSuccess {
            completionHandler(.success(dummyList()))
        } else {
            completionHandler(.failure(generateErrorModel()))
        }
    }

    func detail(id _: String, completionHandler: @escaping (Result<SuperHeroesEntity, ErrorEntity>) -> Void) {
        if detailSuccess {
            completionHandler(.success(dummy()))
        } else {
            completionHandler(.failure(generateErrorModel()))
        }
    }

    private func dummy() -> SuperHeroesEntity {
        SuperHeroesEntity(id: 1, name: "name.1", resultDescription: "resultDescription", thumbnail: Thumbnail(path: "path"), urls: [])
    }

    private func dummyList() -> [SuperHeroesEntity] {
        return [
            SuperHeroesEntity(id: 1, name: "name.1", resultDescription: "resultDescription", thumbnail: Thumbnail(path: "path"), urls: []),
            SuperHeroesEntity(id: 2, name: "name.2", resultDescription: "resultDescription", thumbnail: Thumbnail(path: "path"), urls: []),
            SuperHeroesEntity(id: 3, name: "name.3", resultDescription: "resultDescription", thumbnail: Thumbnail(path: "path"), urls: []),
        ]
    }

    private func generateErrorModel() -> ErrorEntity {
        return ErrorEntity(
            error: nil,
            exception: nil,
            message: "Error unexpected",
            path: nil,
            status: 400,
            timestamp: nil
        )
    }
}
