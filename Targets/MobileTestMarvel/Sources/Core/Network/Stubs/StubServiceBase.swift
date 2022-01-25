import Foundation
import Mimic

class StubServiceBase<T, D>: NSObject {
    enum DataType {
        case dictionary
        case array
    }

    struct Object: Decodable {
        let id: String
        let title: String
        let count: Int
    }

    private let domainNetwork: DomainNetworkBase<T>

    var network: D {
        // swiftlint:disable:next force_cast
        return domainNetwork as! D
    }

    init(domainNetwork: DomainNetworkBase<T>) {
        self.domainNetwork = domainNetwork
    }

    func readJSON(fileName: String) -> [String: AnyObject] {
        let data = readJSONData(fileName: fileName)
        if
            let json = try? JSONSerialization.jsonObject(with: data, options: [.allowFragments]),
            let object = json as? [String: AnyObject]
        {
            return object
        } else {
            fatalError("Could not serialize file \(fileName) into Dictionary")
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
        if
            let fileURL = testBundle.url(forResource: fileName, withExtension: StubConstants.defaultExtension),
            let data = try? Data(contentsOf: fileURL)
        {
            return data
        } else {
            fatalError("File: \(fileName), not found a Bundle")
        }
    }

    func addStub(url: String, fileName: String, method: MimicHTTPMethod, dataType: DataType? = nil, code: Int? = nil, delay: TimeInterval = 1) {
        let data = readData(dataType: dataType ?? .array, fileName: fileName)
        Mimic.mimic(
            request: request(with: method, url: url),
            delay: delay,
            response: response(with: data, status: code ?? 200)
        )
    }

    private func readData(dataType: DataType, fileName: String) -> Any {
        switch dataType {
        case .array:
            return readJSONArray(fileName: fileName)
        case .dictionary:
            return readJSON(fileName: fileName)
        }
    }
}
