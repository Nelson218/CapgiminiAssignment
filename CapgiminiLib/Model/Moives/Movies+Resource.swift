

import Foundation
extension Movies {
    internal enum EndPoints: String {
        case root = "movie/top_rated"
        case similarMovie = "movie/"
    }
    
    @discardableResult
    public static func fetch(completionHandler: @escaping (Self) -> Void, failure: @escaping (ErrorConfig) -> Void) -> URLSessionDataTask {
        let resource = Resource<Self>(forURL: EndPoints.root.rawValue, decoder: JSONDecoder())
        return fetch(resource: resource, completionHandler: completionHandler, failure: failure)
    }
    
    @discardableResult
    public static func fetchForSimilarMovie(forMovieID movieID: Int, completionHandler: @escaping (Self) -> Void, failure: @escaping (ErrorConfig) -> Void) -> URLSessionDataTask {
        let resource = Resource<Self>(forURL: EndPoints.similarMovie.rawValue + "\(movieID)" + "/similar", decoder: JSONDecoder())
        return fetch(resource: resource, completionHandler: completionHandler, failure: failure)
    }
    
    @discardableResult
    public static func fetch(resource: Resource<Self>, completionHandler: @escaping (Self) -> Void, failure: @escaping (ErrorConfig) -> Void) -> URLSessionDataTask {
        let request = Service<Self>(resource: resource) { (result: ServiceResult<Self>) in
            if let value = result.value {
                completionHandler(value)
            } else {
                failure(ErrorConfig(statusCode: result.statusCode, error: result.error))
            }
        }
        
        return request.dataTask
    }
}
