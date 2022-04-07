
import Foundation

internal extension HTTPStatusCode {
    
    var title: String {
        switch self {
        case .unreachable: return "Not reachable"
        case .notFound: return "Not found"
        case .malformedContent: return "Content Error"
        default: return "No Response"
        }
    }
    
    var body: String {
        switch self {
        case .unreachable: return "Not able to reach server"
        case .notFound: return "No content found"
        case .malformedContent: return "Something has gone wrong"
        default: return "No response"
        }
    }
    
    var buttonTitle: String {
        return "Retry"
    }
    
    var showRetryButton: Bool {
        switch self {
        case .notFound: return false
        default: return true
        }
    }
}
