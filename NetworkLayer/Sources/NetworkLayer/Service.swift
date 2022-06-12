import Foundation

public protocol ServiceProtocol: AnyObject {
    func fetchResponse<T: Decodable>(of type: T.Type,
                                     from url: URL?,
                                     with completionHandler: @escaping (Result<T, NetworkError>) -> Void)
}

public final class Service: ServiceProtocol {
    public init() {}
    public func fetchResponse<T: Decodable>(of type: T.Type = T.self,
                                            from url: URL?,
                                            with completionHandler: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = url else {
            completionHandler(.failure(.badURL))
            return
        }
        let request = URLRequest(url: url)
        print("""
        🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎
            # Request #
        URL: \(request.url?.absoluteString ?? "Empty URL")
        🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎🥎
        """)
        URLSession.shared.dataTask(with: request) { data, resp, err in
            if let err = err {
                completionHandler(.failure(.badRequest(err)))
                return
            }
            
            guard let resp = resp as? HTTPURLResponse else {
                completionHandler(.failure(.badResponse))
                return
            }
            
            guard let data = data, resp.statusCode == 200 else {
                completionHandler(.failure(.badDataNilOrResponseNotOk))
                return
            }
            do {
                let decoder = JSONDecoder()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                let decodedData = try decoder.decode(T.self, from: data)
                completionHandler(.success(decodedData))
                print("""
                💎💎💎💎💎💎💎💎💎💎💎💎💎💎💎💎💎💎💎💎💎💎💎💎💎💎💎💎
                    # Response #
                \(data.prettyString ?? "Empty Response")
                💎💎💎💎💎💎💎💎💎💎💎💎💎💎💎💎💎💎💎💎💎💎💎💎💎💎💎💎
                """)
            } catch let err {
                completionHandler(.failure(.badParse(err)))
            }
        }.resume()
    }
    
    
}

public enum NetworkError: Error {
    case badURL
    case badRequest(Error?)
    case badResponse
    case badDataNilOrResponseNotOk
    case badParse(Error?)
}
