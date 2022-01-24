import Foundation

class MarvelNetworkRestApi: NetworkBaseRestApi<Endpoint.Marvel, MarvelNetwork>, MarvelRestApi {
    func list(amount: String, completionHandler: @escaping (Result<[SuperHeroesEntity], ErrorEntity>) -> Void) {
        guard var urlComponents = URLComponents(string: domainNetwork.url(for: .list)) else {
            completionHandler(.failure(codableHelper.defaultError()))
            return
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "ts", value: "1"),
            URLQueryItem(name: "apikey", value: "fb56e964fbd780dca4144d09c20ba280"),
            URLQueryItem(name: "hash", value: "a1c067d96d38d3f746f9d0dcb613eddb"),
            URLQueryItem(name: "limit", value: amount),
        ]

        guard let url = urlComponents.url else {
            completionHandler(.failure(codableHelper.defaultError()))
            return
        }

        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                if let status = error as NSError? {
                    switch status.code {
                    case HttpStatus.offline, HttpStatus.connection:
                        completionHandler(.failure(self.codableHelper.networkError()))
                        return
                    default:
                        completionHandler(.failure(self.codableHelper.defaultError()))
                        return
                    }
                }

                completionHandler(.failure(self.codableHelper.defaultError()))
                return
            }
            guard let data = data, let status = (response as? HTTPURLResponse)?.statusCode else { return }
            if status != HttpStatus.success {
                completionHandler(.failure(self.codableHelper.defaultError()))
                return
            }
            do {
                let decoder = JSONDecoder()
                let parsedResponse = try decoder.decode(WelcomeEntity.self, from: data)
                completionHandler(.success(parsedResponse.data.results))
            } catch _ {
                completionHandler(.failure(self.codableHelper.defaultError()))
            }
        }
        task.resume()
    }

    func detail(id: String, completionHandler: @escaping (Result<SuperHeroesEntity, ErrorEntity>) -> Void) {
        guard var urlComponents = URLComponents(string: String(format: domainNetwork.url(for: .detail), id)) else {
            completionHandler(.failure(codableHelper.defaultError()))
            return
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "ts", value: "1"),
            URLQueryItem(name: "apikey", value: "fb56e964fbd780dca4144d09c20ba280"),
            URLQueryItem(name: "hash", value: "a1c067d96d38d3f746f9d0dcb613eddb"),
        ]

        guard let url = urlComponents.url else {
            completionHandler(.failure(codableHelper.defaultError()))
            return
        }

        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                if let status = error as NSError? {
                    switch status.code {
                    case HttpStatus.offline, HttpStatus.connection:
                        completionHandler(.failure(self.codableHelper.networkError()))
                        return
                    default:
                        completionHandler(.failure(self.codableHelper.defaultError()))
                        return
                    }
                }

                completionHandler(.failure(self.codableHelper.defaultError()))
                return
            }
            guard let data = data, let status = (response as? HTTPURLResponse)?.statusCode else { return }
            if status != HttpStatus.success {
                completionHandler(.failure(self.codableHelper.defaultError()))
                return
            }
            do {
                let decoder = JSONDecoder()
                let parsedResponse = try decoder.decode(WelcomeEntity.self, from: data)
                if let superHero = parsedResponse.data.results.first {
                    completionHandler(.success(superHero))
                } else {
                    completionHandler(.failure(self.codableHelper.defaultError()))
                }
            } catch _ {
                completionHandler(.failure(self.codableHelper.defaultError()))
            }
        }
        task.resume()
    }
}
