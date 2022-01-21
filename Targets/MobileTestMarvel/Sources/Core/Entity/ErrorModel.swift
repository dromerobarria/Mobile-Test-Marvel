struct ErrorModel: Error {
    let error: String?
    let exception: String?
    let message: String
    let path: String?
    let status: Int?
    let timestamp: Float?
}
