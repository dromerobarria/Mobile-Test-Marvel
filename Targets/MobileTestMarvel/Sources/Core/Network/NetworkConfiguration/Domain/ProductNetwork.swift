class MarvelNetwork: DomainNetworkBase<Endpoint.Marvel> {
    override func url(for endpoint: Endpoint.Marvel) -> String {
        return baseBFFURL + endpoint.rawValue
    }
}
