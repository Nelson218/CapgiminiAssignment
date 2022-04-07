
import Foundation

public protocol LogoImageProtocol {
    var logoImage: String? { get }
}

extension LogoImageProtocol {
    public var logoURL: URL? {
        guard let logoImage = logoImage else { return nil }
        let imageURL = BaseURL.imageRootAPI.rawValue + logoImage
        return URL(string: imageURL)
    }
}

public struct Movies: Decodable {
    public let results: [Movie]
    public private(set) var page: Int
    public private(set) var total_pages: Int
}

public struct Movie: Decodable, Encodable, LogoImageProtocol {
    public private(set) var id: Int
    public private(set) var overview: String
    public private(set) var averageVote: Float
    public private(set) var popularity: Float
    public private(set) var logoImage: String?
    public private(set) var title: String
    internal let releaseDate: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case overview = "overview"
        case logoImage = "poster_path"
        case averageVote = "vote_average"
        case popularity = "popularity"
        case releaseDate = "release_date"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(type(of: id), forKey: .id)
        title = try container.decode(type(of: title), forKey: .title)
        overview = try container.decode(type(of: overview), forKey: .overview)
        logoImage = try? container.decode(type(of: logoImage), forKey: .logoImage)
        averageVote = try container.decode(type(of: averageVote), forKey: .averageVote)
        popularity = try container.decode(type(of: popularity), forKey: .popularity)
        releaseDate = try container.decode(type(of: releaseDate), forKey: .releaseDate)
    }
    
    public func throwingFunc(value: Bool) throws {
        if value {
            throw CommonError.unknownError(errorString: "Error")
        }
    }
}

extension Movie {
    
    public static var `defalut`: Movie = {
        Movie()
    }()
    
    private init() {
        self.id = 635302
        self.overview = "Tanjirō Kamado, joined with Inosuke Hashibira, a boy raised by boars who wears a boar's head, and Zenitsu Agatsuma, a scared boy who reveals his true power when he sleeps, boards the Infinity Train on a new mission with the Fire Hashira, Kyōjurō Rengoku, to defeat a demon who has been tormenting the people and killing the demon slayers who oppose it!"
        self.averageVote = 34.34
        self.popularity = 3465.935
        self.logoImage = "/h8Rb9gBr48ODIwYUttZNYeMWeUU.jpg"
        self.title = "Demon Slayer: Kimetsu no Yaiba - The Movie: Mugen Train"
        self.releaseDate = "2020-10-16"
    }
}
