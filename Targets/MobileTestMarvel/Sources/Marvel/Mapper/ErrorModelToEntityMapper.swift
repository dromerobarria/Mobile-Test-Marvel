import Foundation

class ErrorModelToEntityMapper: Mapper<ErrorModel, ErrorEntity> {
    override func reverseMap(value: ErrorEntity) -> ErrorModel {
        return ErrorModel(
            error: value.error,
            exception: value.exception,
            message: value.message,
            path: value.path,
            status: value.status,
            timestamp: value.timestamp
        )
    }
}
