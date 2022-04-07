
import Foundation

internal enum HttpMethod: String {
    case post
    case get
    case put
    case delete
    
    internal var rawValue: String {
        switch self {
        case .post: return "POST"
        case .get: return "GET"
        case .put: return "PUT"
        case .delete: return "DELETE"
        }
    }
}

internal enum BaseURL: String {
    case rootAPI
    case imageRootAPI
    
    internal var rawValue: String {
        switch self {
        case .rootAPI: return "https://api.themoviedb.org/3"
        case .imageRootAPI: return "https://image.tmdb.org/t/p/w500"
        }
    }
}

internal struct AppConfiguration {
    internal let apiKey = "40012423995e39657de639e45790fd2e"
    internal let language = "en-US"
    internal let baseURL: BaseURL
    internal let httpMethod: HttpMethod
    internal let queryParams: [URLQueryItem]
    
    internal init(baseURL: BaseURL, HTTPMethodType httpMethod: HttpMethod) {
        self.baseURL = baseURL
        self.httpMethod = httpMethod
        queryParams = [URLQueryItem(name: "api_key", value: apiKey),
                       URLQueryItem(name: "language", value: language)]
    }
    
    internal static var `default`: AppConfiguration = {
        return AppConfiguration(baseURL: .rootAPI, HTTPMethodType: .get)
    }()
}
