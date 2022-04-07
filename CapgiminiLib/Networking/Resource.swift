
import Foundation

public struct Resource<T> {
    internal var urlRequest: URLRequest
    internal var parse: ((Data) -> T?)?
}

extension Resource {
    internal init(forURL: String, additionalQueryItems: URLQueryItem? = nil, Configuration appConfiguration: AppConfiguration = .default) {
        
        //check if forURL has prefix /
        var forURL = forURL
        if !forURL.hasPrefix(#"/"#) {
            forURL = #"/"# + forURL
        }
        
        let urlString = appConfiguration.baseURL.rawValue + "\(forURL)"
        guard let url = URL(string: urlString) else  {
            fatalError("Error while constructing url \(urlString)")
        }
        
        var component = URLComponents(url: url, resolvingAgainstBaseURL: false)
        component?.queryItems = appConfiguration.queryParams
        if let additionalQueryItems = additionalQueryItems {
            component?.queryItems?.append(additionalQueryItems)
        }
        
        guard let queriedURL = component?.url else {
            fatalError("Error while constructing url \(url) with Params \(appConfiguration.queryParams)")
        }
        
        self.urlRequest = URLRequest(url: queriedURL)
        self.urlRequest.httpMethod = appConfiguration.httpMethod.rawValue
        
        parse = { (data) in
            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? T {
                return json
            }
                              
            if let string = String(data: data, encoding: .utf8) {
                if T.self == Int.self, let integer = Int(string) as? T {
                    return integer
                }
                if T.self == Float.self, let integer = Float(string) as? T {
                    return integer
                }
                if let _string = string as? T {
                    return _string
                }
            }
            return nil
        }
    }
}

extension Resource where T: Decodable {
    internal init(forURL: String, additionalQueryItems: URLQueryItem? = nil, Configuration appConfiguration: AppConfiguration = .default, decoder: JSONDecoder) {
        self.init(forURL: forURL, additionalQueryItems: additionalQueryItems, Configuration: appConfiguration)
        parse = { (data) in
            return try? decoder.decode(T.self, from: data)
        }
    }
}
