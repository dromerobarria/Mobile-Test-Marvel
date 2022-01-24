@testable import MobileTestMarvel
import XCTest

class SuperHeroesTests: TestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testIsTesting() {
        let superHeroes: [SuperHeroesViewModel] = [SuperHeroesViewModel(id: 1, name: "name.1", resultDescription: "resultDescription.1", thumbnail: Thumbnail(path: "path.1"), urls: []), SuperHeroesViewModel(id: 2, name: "name.2", resultDescription: "resultDescription.2", thumbnail: Thumbnail(path: "path.2"), urls: [])]
        SuperHeroesDB.updateSuperHeroes(superHeroesModels: superHeroes)
        XCTAssertEqual(SuperHeroesDB.all(), superHeroes)
    }
}
