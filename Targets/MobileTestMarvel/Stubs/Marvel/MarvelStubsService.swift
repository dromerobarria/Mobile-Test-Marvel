import Foundation
import Mimic

class MarvelStubsService: StubServiceBase<Endpoint.Marvel, MarvelNetwork> {
    func stubAll() {
        stubSuperHeroesList()
    }

    private func stubSuperHeroesList() {
        let url = String(format: network.url(for: .list))
        addStub(url: url, fileName: #function, method: .get)
    }
}
