import Foundation

enum NetworkError: Error {
    case client
    case server
    case data
    case parsing
}

class WeatherAPI {
    
    private var currentTask: URLSessionDataTask?

    private lazy var session: URLSession = {
        return URLSession(configuration: configuration)
    }()

    private lazy var configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 20
        return config
    }()

    #if DEBUG
    private static let baseURL = "https://3vrmbfn037.execute-api.us-east-1.amazonaws.com/dev/"
    #else
    private static let baseURL = "https://3vrmbfn037.execute-api.us-east-1.amazonaws.com/prod/"
    #endif

    func getForecast(for latitude: Double, and longitude: Double, units: Units = .us, completion: @escaping (Result<Forecast, NetworkError>) -> Void) {
        var url = URL(string: WeatherAPI.baseURL)!
        url.appendPathComponent("\(latitude),\(longitude)")

        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        let flagsQueryItem = URLQueryItem(name: "exclude", value: "flags")
        let unitsQueryItem = URLQueryItem(name: "units", value: units.rawValue)
        urlComponents.queryItems = [flagsQueryItem, unitsQueryItem]
        
        if let state = currentTask?.state, state == .running {
            currentTask?.cancel()
        }

        print("🌤 Sending forecast request for \(latitude), \(longitude)")
        currentTask = session.dataTask(with: urlComponents.url!) { data, response, error in
            defer {
                self.currentTask = nil
            }
            
            if let _ = error {
                DispatchQueue.main.async {
                completion(.failure(.client))
                }
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                DispatchQueue.main.async {
                    completion(.failure(.server))
                }
                return
            }

            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(.data))
                }
                return
            }

            var forecast: Forecast?
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            do {
                forecast = try decoder.decode(Forecast.self, from: data)
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(.parsing))
                }
            }

            DispatchQueue.main.async {
                completion(Result.success(forecast!))
            }
        }
        currentTask?.resume()
    }
}
