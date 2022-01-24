import Foundation

class CodableHelper {
    enum DefaultKeys {
        static let message = "message"
    }

    func defaultError() -> ErrorEntity {
        return ErrorEntity(
            error: nil,
            exception: nil,
            message: GenericErrorConstants.description,
            path: nil,
            status: GenericErrorConstants.code,
            timestamp: 0
        )
    }

    func networkError() -> ErrorEntity {
        return ErrorEntity(
            error: nil,
            exception: nil,
            message: NetworkErrorConstants.description,
            path: nil,
            status: NetworkErrorConstants.code,
            timestamp: 0
        )
    }
}
