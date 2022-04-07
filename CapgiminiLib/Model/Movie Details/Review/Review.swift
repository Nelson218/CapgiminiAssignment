
import Foundation

public struct ReviewResult: Decodable {
    public let results: [Review]
}

public struct Review: Decodable {
    public let author: String
    public let content: String
}

extension Review {
    public static var `default`: Review = {
        Review(author: "J k Rowling", content: "A lot was changed in this remake and I thought it would irk me.")
    }()
}
