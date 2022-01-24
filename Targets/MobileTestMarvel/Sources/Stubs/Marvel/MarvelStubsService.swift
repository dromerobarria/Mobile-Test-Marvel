import Foundation

class MarvelStubsService: StubServiceBase<Endpoint.Marvel, MarvelNetwork> {
    func stubAll() {
        stubSuperHeroesList()
        stubSuperHeroeDetail()
    }

    private func stubSuperHeroesList() {
        let url = String(format: network.url(for: .list))
        addStub(url: url, fileName: #function, method: .get)
    }
    
    private func stubSuperHeroeDetail() {
        let url = String(format: network.url(for: .detail))
        addStub(url: url, fileName: #function, method: .get)
    }
}
