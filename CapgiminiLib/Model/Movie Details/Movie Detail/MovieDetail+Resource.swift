

import Foundation

extension MovieDetail {
    private enum EndPoints: String {
        case root = "movie/"
    }
    
    @discardableResult
    public static func fetch(forMovieID id: Int, completionHandler: @escaping (Self) -> Void, failure: @escaping (ErrorConfig) -> Void) -> URLSessionDataTask {
                
        let resource = Resource<Self>(forURL: EndPoints.root.rawValue + "\(id)", decoder: JSONDecoder())
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
