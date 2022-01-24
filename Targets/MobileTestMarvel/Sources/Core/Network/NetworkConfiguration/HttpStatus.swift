enum HttpStatus {
    static let badRequest = 400
    static let unauthorized = 401
    static let forbidden = 403
    static let notFound = 404
    static let methodNotAllowed = 405
    static let notAcceptable = 406
    static let proxyAuthenticationRequired = 407
    static let requestTimeout = 408
    static let conflict = 409
    static let gone = 410
    static let lengthRequired = 411
    static let preconditionFailed = 412
    static let internalServerError = 500
    static let success = 200
    static let created = 201
    static let blocked = 423
    static let offline = -1009
    static let connection = -1004
}
