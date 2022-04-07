

import Foundation

internal protocol CastCrewProtocol {
    var name: String { get }
    var detail: String { get }
}

public struct CastCrewDetail {
    public var name: String
    public var nameDetail: NSMutableAttributedString
}

extension Cast: CastCrewProtocol {
    var detail: String {
        return character
    }
}

extension Crew: CastCrewProtocol {
    var detail: String {
        return job
    }
}
