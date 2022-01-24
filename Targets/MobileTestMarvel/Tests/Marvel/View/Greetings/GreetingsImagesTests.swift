@testable import MobileTestMarvel
import UIKit
import XCTest

class GreetingsImagesTests: TestCase {
    let renderedAsTemplate = [""]

    let names: [String: UIImage] = [
        "icon-hulk": GreetingsImages.Icons.iconHulk,
        "icon-america": GreetingsImages.Icons.iconAmerica,
        "icon-ironMan": GreetingsImages.Icons.iconIronMan,
    ]

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testImages() {
        for (name, expected) in names {
            assert(imageName: name, expectedImage: expected)
        }
    }

    private func assert(imageName named: String, expectedImage: UIImage) {
        guard let image = UIImage(named: named) else {
            XCTFail("Image with name '\(named)' not found")
            return
        }
        let representation = renderedAsTemplate.contains(named) ?
            image.withRenderingMode(.alwaysTemplate).pngData() : image.pngData()
        let expectedRepresentation = expectedImage.pngData()
        XCTAssertEqual(representation, expectedRepresentation, "Image with name '\(named)' not found")
    }
}
