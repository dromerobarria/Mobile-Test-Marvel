import Mimic
@testable import MobileTestMarvel
import XCTest

class TestUtils {}

extension TestCase {
    func readJSON(fileName: String) -> [String: AnyObject] {
        let data = readJSONData(fileName: fileName)
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [.allowFragments])
            guard let object = json as? [String: AnyObject] else {
                fatalError("Could not serialize file into Dictionary")
            }
            return object
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    func readJSONArray(fileName: String) -> [AnyObject] {
        let data = readJSONData(fileName: fileName)
        if
            let json = try? JSONSerialization.jsonObject(with: data, options: [.allowFragments]),
            let object = json as? [AnyObject]
        {
            return object
        } else {
            fatalError("Could not serialize file \(fileName) into Array.")
        }
    }

    func readJSONData(fileName: String) -> Data {
        let testBundle = Bundle(for: type(of: self))
        if let fileURL = testBundle.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileURL)
                return data
            } catch {
                fatalError(error.localizedDescription)
            }
        } else {
            fatalError("File: \(fileName), not found un Bundle")
        }
    }

    func mockedViewController() -> UIViewController {
        let viewController = UIViewController()
        UIApplication.shared.keyWindow?.rootViewController = viewController
        viewController.viewDidLoad()
        return viewController
    }
}
